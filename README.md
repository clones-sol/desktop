# Clones Desktop

A desktop application for contributing to the world's largest dataset for multimodal computer-use agents. Earn $CLONES, $USDC or $SOL tokens in two ways: record your desktop interactions to train better computer-use AI, or provide secure virtual desktop infrastructure for deploying these agents. 

Built from the ground up with privacy and security as core principles. See our [Privacy Policy](PRIVACY.md) for details.

## Development

This project is a monorepo containing the Flutter application and the Rust backend.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) - Flutter 3.29+
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

    Create a `.env` file in the `clones` directory (See `env.example`)

2.  **Run the application**

    The recommended way to run the application in development mode is to use the provided `launch.json` configuration in VS Code.

    1.  Open the project in VS Code.
    2.  Go to the "Run and Debug" panel.
    3.  Select the **[COMPOUND] Flutter with IPC** configuration from the dropdown menu.
    4.  Press F5 to start debugging.

    This will launch both the Flutter application and the Rust backend with the Inter-Process Communication (IPC) server.


### Note

*** This Application is currently in active development so it might fail to build. Please refer to issues or create new issues if you find any. Contributions are welcomed.