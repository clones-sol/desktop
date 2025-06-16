import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viralmind_flutter/domain/models/submission/pool_submission.dart';
import 'package:viralmind_flutter/ui/components/buttons/btn_primary.dart';
import 'package:viralmind_flutter/utils/env.dart';

class DownloadScriptsModal extends StatefulWidget {
  final List<PoolSubmission> submissions;
  const DownloadScriptsModal({super.key, required this.submissions});

  @override
  State<DownloadScriptsModal> createState() => _DownloadScriptsModalState();
}

class _DownloadScriptsModalState extends State<DownloadScriptsModal>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _generateNodejsScript() {
    final submissionLinks = widget.submissions
        .where((sub) => sub.files.isNotEmpty)
        .expand((sub) => sub.files.map((file) {
              final s3Key = file.s3Key ?? '';
              return {
                'url': '${Env.s3BaseUrl}/$s3Key',
                'id': sub.id,
                'filename': s3Key.split('-').last,
              };
            }))
        .toList();

    return """
// Node.js Download Script
const fs = require('fs');
const path = require('path');
const https = require('https');

// List of files to download
const files = ${submissionLinks.map((e) => e.toString()).join(',\n')};

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

  console.log(`Downloading \${file.url} to \${filePath}...`);
  
  https.get(file.url, response => {
    if (response.statusCode !== 200) {
      console.error(`Failed to download \${file.url}: \${response.statusCode}`);
      fs.unlinkSync(filePath); // Remove file if download failed
      return;
    }

    response.pipe(fileStream);

    fileStream.on('finish', () => {
      fileStream.close();
      console.log(`Downloaded \${file.filename}`);
    });
  }).on('error', err => {
    fs.unlinkSync(filePath); // Remove file if download failed
    console.error(`Error downloading \${file.url}: \${err.message}`);
  });
});
""";
  }

  String _generatePythonScript() {
    final submissionLinks = widget.submissions
        .where((sub) => sub.files.isNotEmpty)
        .expand((sub) => sub.files.map((file) {
              final s3Key = file.s3Key ?? '';
              return {
                'url': '${Env.s3BaseUrl}/$s3Key',
                'id': sub.id,
                'filename': s3Key.split('-').last,
              };
            }))
        .toList();

    return """
# Python Download Script
import os
import requests
from pathlib import Path

# List of files to download
files = ${submissionLinks.map((e) => e.toString()).join(',\n')}

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
""";
  }

  String _generateShellScript() {
    final submissionLinks = widget.submissions
        .where((sub) => sub.files.isNotEmpty)
        .expand((sub) => sub.files.map((file) {
              final s3Key = file.s3Key ?? '';
              return {
                'url': '${Env.s3BaseUrl}/$s3Key',
                'id': sub.id,
                'filename': s3Key.split('-').last,
              };
            }))
        .toList();

    final filesString = submissionLinks
        .map((file) => '  "${file['url']}|${file['id']}|${file['filename']}"')
        .join('\n');

    return """
#!/bin/bash
# Shell Download Script

# List of files to download
declare -a files=(
$filesString
)

# Create downloads directory if it doesn't exist
mkdir -p downloads

# Download each file
for file_info in "\${files[@]}"; do
  IFS="|" read -r url id filename <<< "\$file_info"
  
  # Create directory for submission if it doesn't exist
  dir_path="downloads/\$id"
  mkdir -p "\$dir_path"
  
  file_path="\$dir_path/\$filename"
  
  echo "Downloading \$url to \$file_path..."
  
  if command -v curl &> /dev/null; then
    curl -L -o "\$file_path" "\$url" || {
      echo "Error downloading \$url"
      rm -f "\$file_path" # Remove file if download failed
    }
  elif command -v wget &> /dev/null; then
    wget -O "\$file_path" "\$url" || {
      echo "Error downloading \$url"
      rm -f "\$file_path" # Remove file if download failed
    }
  else
    echo "Error: Neither curl nor wget is installed"
    exit 1
  fi
  
  echo "Downloaded \$filename"
done
""";
  }

  String _getActiveScript() {
    switch (_tabController.index) {
      case 0:
        return _generateNodejsScript();
      case 1:
        return _generatePythonScript();
      case 2:
        return _generateShellScript();
      default:
        return '';
    }
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _getActiveScript())).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Script copied to clipboard!')),
      );
    });
  }

  // TODO: implement download script
  void _downloadScript() {}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Download Submissions Scripts'),
      content: SizedBox(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Node.js'),
                Tab(text: 'Python'),
                Tab(text: 'Shell'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildScriptView(_generateNodejsScript()),
                  _buildScriptView(_generatePythonScript()),
                  _buildScriptView(_generateShellScript()),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        BtnPrimary(
            buttonText: 'Copy to Clipboard',
            onTap: _copyToClipboard,
            btnPrimaryType: BtnPrimaryType.outlinePrimary),
        BtnPrimary(
          buttonText: 'Download Script',
          onTap: _downloadScript,
          btnPrimaryType: BtnPrimaryType.outlinePrimary,
        ),
        BtnPrimary(
          buttonText: 'Close',
          onTap: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildScriptView(String script) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: SelectableText(script),
      ),
    );
  }
}
