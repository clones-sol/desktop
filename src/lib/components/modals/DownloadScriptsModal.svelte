<script lang="ts">
  import Button from '$lib/components/form/Button.svelte';
  import { onMount } from 'svelte';
  import type { PoolSubmission } from '$lib/types/forge';

  export let open = false;
  export let submissions: PoolSubmission[] = [];
  export let onClose: () => void;

  let activeTab = 'nodejs';

  const S3_BASE_URL = import.meta.env.VITE_S3_BASE_URL;

  // Generate Node.js download script
  function generateNodejsScript() {
    const submissionLinks = submissions
      .filter((sub) => sub.files && sub.files.length > 0)
      .map((sub) => {
        return sub.files.map((file) => {
          const s3Key = file.s3Key || '';
          return {
            url: `${S3_BASE_URL}/${s3Key}`,
            id: sub._id,
            filename: s3Key.split('-').pop() || 'file'
          };
        });
      })
      .flat();

    return `// Node.js Download Script
const fs = require('fs');
const path = require('path');
const https = require('https');

// List of files to download
const files = ${JSON.stringify(submissionLinks, null, 2)};

// Create downloads directory if it doesn't exist
if (!fs.existsSync('downloads')) {
  fs.mkdirSync('downloads');
}

// Download each file
files.forEach(file => {
  // Create directory for submission if it doesn't exist
  const dirPath = path.join('downloads', file.id);
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
  }

  const filePath = path.join(dirPath, file.filename);
  const fileStream = fs.createWriteStream(filePath);

  console.log(\`Downloading \${file.url} to \${filePath}...\`);
  
  https.get(file.url, response => {
    if (response.statusCode !== 200) {
      console.error(\`Failed to download \${file.url}: \${response.statusCode}\`);
      fs.unlinkSync(filePath); // Remove file if download failed
      return;
    }

    response.pipe(fileStream);

    fileStream.on('finish', () => {
      fileStream.close();
      console.log(\`Downloaded \${file.filename}\`);
    });
  }).on('error', err => {
    fs.unlinkSync(filePath); // Remove file if download failed
    console.error(\`Error downloading \${file.url}: \${err.message}\`);
  });
});
`;
  }

  // Generate Python download script
  function generatePythonScript() {
    const submissionLinks = submissions
      .filter((sub) => sub.files && sub.files.length > 0)
      .map((sub) => {
        return sub.files.map((file) => {
          const s3Key = file.s3Key || '';
          return {
            url: `${S3_BASE_URL}/${s3Key}`,
            id: sub._id,
            filename: s3Key.split('-').pop() || 'file'
          };
        });
      })
      .flat();

    return `# Python Download Script
import os
import requests
from pathlib import Path

# List of files to download
files = ${JSON.stringify(submissionLinks, null, 2)}

# Create downloads directory if it doesn't exist
downloads_dir = Path("downloads")
downloads_dir.mkdir(exist_ok=True)

# Download each file
for file in files:
    # Create directory for submission if it doesn't exist
    dir_path = downloads_dir / file["id"]
    dir_path.mkdir(exist_ok=True)
    
    file_path = dir_path / file["filename"]
    
    print(f"Downloading {file['url']} to {file_path}...")
    
    try:
        response = requests.get(file["url"], stream=True)
        response.raise_for_status()
        
        with open(file_path, "wb") as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)
        
        print(f"Downloaded {file['filename']}")
    except Exception as e:
        print(f"Error downloading {file['url']}: {e}")
        if file_path.exists():
            file_path.unlink()
`;
  }

  // Generate Shell script
  function generateShellScript() {
    const submissionLinks = submissions
      .filter((sub) => sub.files && sub.files.length > 0)
      .map((sub) => {
        return sub.files.map((file) => {
          const s3Key = file.s3Key || '';
          return {
            url: `${S3_BASE_URL}/${s3Key}`,
            id: sub._id,
            filename: s3Key.split('-').pop() || 'file'
          };
        });
      })
      .flat();

    return `#!/bin/bash
# Shell Download Script

# List of files to download
declare -a files=(
${submissionLinks.map((file) => `  "${file.url}|${file.id}|${file.filename}"`).join('\n')}
)

# Create downloads directory if it doesn't exist
mkdir -p downloads

# Download each file
for file_info in "\${files[@]}"; do
  IFS="|" read -r url id filename <<< "$file_info"
  
  # Create directory for submission if it doesn't exist
  dir_path="downloads/$id"
  mkdir -p "$dir_path"
  
  file_path="$dir_path/$filename"
  
  echo "Downloading $url to $file_path..."
  
  if command -v curl &> /dev/null; then
    curl -L -o "$file_path" "$url" || {
      echo "Error downloading $url"
      rm -f "$file_path" # Remove file if download failed
    }
  elif command -v wget &> /dev/null; then
    wget -O "$file_path" "$url" || {
      echo "Error downloading $url"
      rm -f "$file_path" # Remove file if download failed
    }
  else
    echo "Error: Neither curl nor wget is installed"
    exit 1
  fi
  
  echo "Downloaded $filename"
done
`;
  }

  function getActiveScript() {
    switch (activeTab) {
      case 'nodejs':
        return generateNodejsScript();
      case 'python':
        return generatePythonScript();
      case 'shell':
        return generateShellScript();
      default:
        return '';
    }
  }

  function copyToClipboard() {
    const scriptContent = getActiveScript();
    navigator.clipboard
      .writeText(scriptContent)
      .then(() => {
        alert('Script copied to clipboard!');
      })
      .catch((err) => {
        console.error('Failed to copy script:', err);
        alert('Failed to copy script to clipboard');
      });
  }

  function downloadScript() {
    const scriptContent = getActiveScript();
    const blob = new Blob([scriptContent], { type: 'text/plain' });
    const link = document.createElement('a');
    const extension = activeTab === 'nodejs' ? 'js' : activeTab === 'python' ? 'py' : 'sh';

    link.href = URL.createObjectURL(blob);
    link.download = `download-submissions.${extension}`;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }
</script>

{#if open}
  <div class="fixed inset-0 z-50 flex items-center justify-center bg-black/50">
    <div class="bg-white rounded-lg shadow-lg p-6 max-w-4xl w-full">
      <div class="flex justify-between items-center mb-4">
        <h2 class="text-xl font-semibold">Download Submissions Scripts</h2>
        <button aria-label="Close" class="text-gray-500 hover:text-gray-700" onclick={onClose}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>

      <div class="mb-4">
        <p class="text-gray-700 mb-2">
          These scripts will download all submission files to a "downloads" folder in the directory
          where you run the script. Each submission will be in its own subfolder named with the
          submission ID.
        </p>
        <p class="text-gray-700">
          Total submissions with files: {submissions.filter(
            (sub) => sub.files && sub.files.length > 0
          ).length}
        </p>
      </div>

      <div class="border-b border-gray-200 mb-4">
        <ul class="flex flex-wrap -mb-px">
          <li class="mr-2">
            <button
              class={`inline-block p-4 rounded-t-lg ${activeTab === 'nodejs' ? 'text-secondary-600 border-b-2 border-secondary-600' : 'text-gray-500 hover:text-gray-700'}`}
              onclick={() => (activeTab = 'nodejs')}>
              Node.js
            </button>
          </li>
          <li class="mr-2">
            <button
              class={`inline-block p-4 rounded-t-lg ${activeTab === 'python' ? 'text-secondary-600 border-b-2 border-secondary-600' : 'text-gray-500 hover:text-gray-700'}`}
              onclick={() => (activeTab = 'python')}>
              Python
            </button>
          </li>
          <li>
            <button
              class={`inline-block p-4 rounded-t-lg ${activeTab === 'shell' ? 'text-secondary-600 border-b-2 border-secondary-600' : 'text-gray-500 hover:text-gray-700'}`}
              onclick={() => (activeTab = 'shell')}>
              Shell Script
            </button>
          </li>
        </ul>
      </div>

      <div class="bg-gray-100 p-4 rounded-lg mb-4">
        <pre class="text-sm text-gray-800 overflow-auto max-h-80">{getActiveScript()}</pre>
      </div>

      <div class="mb-4 text-xs text-gray-500">
        By downloading or using these scripts, you agree to our
        <a
          href={import.meta.env.VITE_PRIVACY_POLICY_URL}
          target="_blank"
          class="text-secondary-300 hover:underline">
          Privacy Policy
        </a>
        .
      </div>

      <div class="flex justify-end gap-3">
        <Button variant="secondary" onclick={copyToClipboard}>Copy to Clipboard</Button>
        <Button variant="secondary" onclick={downloadScript}>Download Script</Button>
        <Button variant="primary" onclick={onClose}>Close</Button>
      </div>
    </div>
  </div>
{/if}
