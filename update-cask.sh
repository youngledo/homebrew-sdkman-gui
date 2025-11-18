#!/bin/bash
set -e

# Update Homebrew Cask SHA256 checksums after a new release
# Usage: ./update-cask.sh <version>

if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

VERSION=$1
CASK_FILE="Casks/sdkman-gui.rb"

echo "Updating Cask for version $VERSION..."

# Download DMG files and calculate SHA256
ARM64_URL="https://github.com/youngledo/sdkman-gui/releases/download/v${VERSION}/sdkman-gui_${VERSION}_arm64.dmg"
X86_64_URL="https://github.com/youngledo/sdkman-gui/releases/download/v${VERSION}/sdkman-gui_${VERSION}_x86_64.dmg"

echo "Downloading ARM64 DMG..."
ARM64_SHA256=$(curl -sL "$ARM64_URL" | shasum -a 256 | awk '{print $1}')
echo "ARM64 SHA256: $ARM64_SHA256"

echo "Downloading x86_64 DMG..."
X86_64_SHA256=$(curl -sL "$X86_64_URL" | shasum -a 256 | awk '{print $1}')
echo "x86_64 SHA256: $X86_64_SHA256"

# Update Cask file
sed -i '' "s/version \".*\"/version \"$VERSION\"/" "$CASK_FILE"
sed -i '' "s/ARM64_SHA256_PLACEHOLDER/$ARM64_SHA256/" "$CASK_FILE"
sed -i '' "s/X86_64_SHA256_PLACEHOLDER/$X86_64_SHA256/" "$CASK_FILE"

echo "✓ Cask file updated successfully!"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff"
echo "2. Commit changes: git add Casks/sdkman-gui.rb && git commit -m 'chore: update to version $VERSION'"
echo "3. Push to GitHub: git push origin main"
