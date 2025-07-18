# Clones Desktop

A desktop application for contributing to the world's largest dataset for multimodal computer-use agents. Earn $CLONES tokens in two ways: record your desktop interactions to train better computer-use AI, or provide secure virtual desktop infrastructure for deploying these agents. 

Built from the ground up with privacy and security as core principles. See our [Privacy Policy](PRIVACY.md) for details.

## Development

This project is a monorepo containing the Flutter application and the Rust backend.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Rust](https://www.rust-lang.org/tools/install)
- [VS Code](https://code.visualstudio.com/) with the following extensions:
    - [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
    - [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

### Recommended IDE Setup
[VS Code](https://code.visualstudio.com/) + [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer).

### Backend
To run the desktop application, you need to have the backend running locally.
Please refer to the backend repository for instructions on how to run it in development mode: [@https://github.com/clones-sol/backend](https://github.com/clones-sol/backend)

### Website
To run the desktop application, you need to have the website running locally.
Please refer to the website repository for instructions on how to run it in development mode: [@https://github.com/clones-sol/website](https://github.com/clones-sol/website)

### Desktop Application (Flutter + Rust)

1.  **Configure Environment Variables**

    Create a `.env` file in the `clones` directory with the following content:
    ```
    ENV=dev
    APP_IDENTIFIER_SUFFIX="-devnet"
    VIRAL_TOKEN_ADDRESS=FndpD76kqsCU7RqPRgu2bdcPCNNAzfFW3x8zFBuejuEG
    SOL_TOKEN_ADDRESS=So11111111111111111111111111111111111111112
    PRIVACY_POLICY_URL=https://github.com/clones-sol/desktop/blob/main/PRIVACY.md
    SOLSCAN_BASE_URL=https://solscan.io
    API_WEBSITE_URL=http://localhost:5173
    API_BACKEND_URL=http://localhost:8001
    JUPITER_API_URL=https://api.jup.ag
    ```

2.  **Run the application**

    The recommended way to run the application in development mode is to use the provided `launch.json` configuration in VS Code.

    1.  Open the project in VS Code.
    2.  Go to the "Run and Debug" panel.
    3.  Select the **[COMPOUND] Flutter with IPC** configuration from the dropdown menu.
    4.  Press F5 to start debugging.

    This will launch both the Flutter application and the Rust backend with the Inter-Process Communication (IPC) server.
