# ViralMind Desktop

> 🚧 Work in progress - coming soon!

<p align="center" width="100%">
    <img src="https://github.com/user-attachments/assets/304e2bd6-9584-4d4b-afdb-71d759d91846">
</p>

A desktop application for contributing to the world's largest dataset for multimodal computer-use agents. Earn $VIRAL tokens in two ways: record your desktop interactions to train better computer-use AI, or provide secure virtual desktop infrastructure for deploying these agents. 

Built from the ground up with privacy and security as core principles. See our [Privacy Policy](PRIVACY.md) for details.

## Recording System

Our recording system is designed specifically for training powerful computer-use AI agents through data-driven approaches. Key features include:

### Quest System

<p align="center" width="100%">
    <img src="https://github.com/user-attachments/assets/8f516e95-1a5d-49a0-9c27-aa932b7cd6d5">
</p>

- AI-generated quests, generated from random UI elements from thousands available on your screen

- Ensures diverse, instruction-following demonstration trajectories

- Structured with subobjectives to help AI models break down long trajectories into step-by-step plans

- Example quest shown above: creating a spreadsheet with specific requirements and subobjectives

### Recording Format

Recordings are two files and stored in `%LOCALAPPDATA%\ai.viralmind.desktop\recordings\` on Windows and `${HOME}/Library/Application Support/ai.viralmind.desktop/recordings/` on MacOS:

- .mp4 video capture

- .jsonl event log capturing detailed interaction data

Sample event log format:

```json
{"event":"quest_started","data":{"id":"spreadsheet_creation_01","title":"Create a New Spreadsheet","description":"Open Excel or Google Sheets and create a new spreadsheet with at least 3 columns and 5 rows of data","reward":10},"time":1738564880000}
{"data":{"output":"ffmpeg version 7.1-essentials_build-www.gyan.dev Copyright (c) 2000-2024 the FFmpeg developers"},"event":"ffmpeg_stderr","time":1738564880824}
{"data":{"x":1303.0,"y":1347.0},"event":"mousemove","time":1738564880935}
{"data":{"x":1303.0,"y":1347.0},"event":"mousemove","time":1738564880935}
{"data":{"button":"Left"},"event":"mousedown","time":1738564883325}
{"event":"subobjective_completed","data":{"quest_id":"spreadsheet_creation_01","objective":"Open spreadsheet application","index":1},"time":1738564883525}
{"data":{"key":"H"},"event":"keydown","time":1738564891760}
{"event":"subobjective_completed","data":{"quest_id":"spreadsheet_creation_01","objective":"Create new document","index":2},"time":1738564892000}
{"event":"quest_completed","data":{"id":"spreadsheet_creation_01","reward_earned":10,"time_taken":12000},"time":1738564892500}
```

# Development

## Recommended IDE Setup

[VS Code](https://code.visualstudio.com/) + [Svelte](https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).

## Requirements

### Windows

1. Install bun
```bash
powershell -c "irm bun.sh/install.ps1 | iex"
```
2. Install Microsoft C++ Build Tools
3. Install Rust
```bash
winget install --id Rustlang.Rustup
```

### MacOS

1. Install bun
```bash
curl -fsSL https://bun.sh/install | bash
```

2. Install Build Tools
```bash
xcode-select --install
```

3. Install Rust
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```


### Debian Linux / Ubuntu WSL

1. Install bun
```bash
curl -fsSL https://bun.sh/install | bash
```

2. Install Tauri pre-requisites
```bash
sudo apt update
sudo apt install libwebkit2gtk-4.1-dev \
  build-essential \
  curl \
  wget \
  file \
  libxdo-dev \
  libssl-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

---

## Linux: Screen Capture (X11/Wayland)

The application automatically detects your graphical environment on Linux:

- **X11**: Screen capture uses `ffmpeg -f x11grab ...` (no special configuration required).
- **Wayland**: Screen capture uses `ffmpeg -f pipewire ...` (capture via pipewire).

### Requirements for Wayland Capture

- **Pipewire** must be installed and running (usually the case on recent distributions).
- **FFmpeg** must be compiled with pipewire support (`--enable-libpipewire`).  
  Check with:  
  ```sh
  ffmpeg -formats | grep pipewire
  ```
  If you see a line like `E pipewire`, pipewire support is enabled.

- **Permissions**: You may need to explicitly allow screen capture in your Wayland environment (see your distribution's documentation).

### Troubleshooting

- If recording fails on Wayland, check the logs:  
  - An explicit warning will appear if pipewire or ffmpeg are not available or misconfigured.
- Try starting pipewire manually:  
  ```sh
  systemctl --user start pipewire
  ```
- If possible, test capture with the following command:  
  ```sh
  ffmpeg -f pipewire -i default -frames:v 1 test.png
  ```
  If this fails, check your pipewire and ffmpeg configuration.

- As a last resort, try launching your session in X11 if your environment allows it.

---

## Development

```bash
bun install
```

## Multi-environment configuration

Create a `.env` file at the root of the project with the following content (adapt the values according to your environment):

```
VITE_VIRAL_TOKEN_ADDRESS=HW7D5MyYG4Dz2C98axfjVBeLWpsEnofrqy6ZUwqwpump
VITE_SOL_TOKEN_ADDRESS=So11111111111111111111111111111111111111112
```

For production, create a `.env.production` file with the appropriate values.

Don't forget to add `.env.local` to your `.gitignore` to avoid versioning local secrets.

## Environment Variables Reference

Below is a list of all environment variables used for configuration. Add these to your `.env` (and `.env.production` for production) at the root of your project:

```
# === Frontend (Vite/Svelte) ===
VITE_API_URL=https://viralmind.ai
VITE_S3_BASE_URL=https://training-gym.s3.us-east-2.amazonaws.com
VITE_SOLSCAN_BASE_URL=https://solscan.io
VITE_JUPITER_API_URL=https://api.jup.ag
VITE_PRIVACY_POLICY_URL=https://github.com/viralmind-ai/desktop/blob/main/PRIVACY.md
VITE_VIRAL_TOKEN_ADDRESS=HW7D5MyYG4Dz2C98axfjVBeLWpsEnofrqy6ZUwqwpump
VITE_SOL_TOKEN_ADDRESS=So11111111111111111111111111111111111111112
VITE_ENV=dev

# === Backend (Rust/Tauri) binaries ===
# URLs for platform-specific binaries (override to use custom builds or mirrors)
DUMP_TREE_URL_WIN=https://github.com/viralmind-ai/ax-tree-parsers/releases/latest/download/dump-tree-windows.exe
DUMP_TREE_URL_LINUX=https://github.com/viralmind-ai/ax-tree-parsers/releases/latest/download/dump-tree-linux-x86_64
DUMP_TREE_URL_MACOS=https://github.com/viralmind-ai/ax-tree-parsers/releases/latest/download/dump-tree-macos-arm64

FFMPEG_URL_WIN=https://github.com/viralmind-ai/ffmpeg-binaries/releases/latest/download/ffmpeg-windows.zip
FFMPEG_URL_LINUX=https://github.com/viralmind-ai/ffmpeg-binaries/releases/latest/download/ffmpeg-linux.tar.xz
FFMPEG_URL_MACOS=https://github.com/viralmind-ai/ffmpeg-binaries/releases/latest/download/ffmpeg-macos.zip
FFPROBE_URL_MACOS=https://github.com/viralmind-ai/ffmpeg-binaries/releases/latest/download/ffprobe-macos.zip

PIPELINE_URL_WIN=https://github.com/viralmind-ai/vm-pipeline/releases/latest/download/pipeline-win-x64.exe
PIPELINE_URL_LINUX=https://github.com/viralmind-ai/vm-pipeline/releases/latest/download/pipeline-linux-x64
PIPELINE_URL_MACOS=https://github.com/viralmind-ai/vm-pipeline/releases/latest/download/pipeline-macos-arm64
```

**Notes:**
- All variables starting with `VITE_` are used by the frontend (Svelte/Vite) and must be prefixed as such.
- The backend (Rust/Tauri) uses the other variables for downloading and running platform-specific binaries.
- You can override any of these in `.env.production` for production deployments.
- Never commit secrets or sensitive keys to version control.

## How to run in each environment

### Development (default)
- By default, Vite/SvelteKit loads the `.env` file at the project root.
- To start the app in development mode:

```bash
bun tauri dev
```
(or `bun dev` depending on your setup)

---

### Production
- Place a `.env.production` file at the root with your production variables.
- To build and run for production:

```bash
bun tauri build
```
(or `bun build`)

The build process will automatically use `.env.production` for environment variables.

---

### Other environments (staging, test, etc.)
- Create files like `.env.staging`, `.env.test`, etc.
- To use a custom environment file, you can temporarily copy/rename it to `.env` before running your command, or use a tool like [dotenv-cli](https://www.npmjs.com/package/dotenv-cli`) to specify which file to load.

**Example with dotenv-cli:**
```bash
npx dotenv -e .env.staging -- bun tauri dev
```

---

- `.env` → used by default in development
- `.env.production` → used automatically for production builds
- For other environments, copy the desired file to `.env` or use a tool like dotenv-cli
