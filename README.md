# Homebrew Tap for SDKMAN GUI

This is a Homebrew tap for [SDKMAN GUI](https://github.com/youngledo/sdkman-gui), a modern graphical management tool for SDKMAN.

## Installation

### Using Homebrew (Recommended)

```bash
# Add the tap
brew tap youngledo/sdkman-gui

# Install SDKMAN GUI
brew install --cask sdkman-gui
```

### One-liner

```bash
brew install --cask youngledo/sdkman-gui/sdkman-gui
```

## Prerequisites

SDKMAN must be installed before using SDKMAN GUI:

```bash
curl -s "https://get.sdkman.io" | bash
```

## Updating

```bash
brew upgrade --cask sdkman-gui
```

## Uninstalling

```bash
# Uninstall the app
brew uninstall --cask sdkman-gui

# Remove configuration files (optional)
rm -rf ~/.sdkman-gui
```

## Supported Platforms

- macOS Big Sur (11.0) or later
- Both Intel (x86_64) and Apple Silicon (ARM64) architectures

## Issues

If you encounter any issues, please report them at:
- SDKMAN GUI: https://github.com/youngledo/sdkman-gui/issues
- Homebrew Tap: https://github.com/youngledo/homebrew-sdkman-gui/issues

## License

This tap follows the same license as SDKMAN GUI.