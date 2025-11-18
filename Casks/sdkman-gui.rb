cask "sdkman-gui" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "ARM64_SHA256_PLACEHOLDER",
         intel: "X86_64_SHA256_PLACEHOLDER"

  url "https://github.com/youngledo/sdkman-gui/releases/download/v#{version}/sdkman-gui_#{version}_#{arch}.dmg",
      verified: "github.com/youngledo/sdkman-gui"
  name "SDKMAN GUI"
  desc "Modern graphical management tool for SDKMAN"
  homepage "https://github.com/youngledo/sdkman-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "SDKMAN GUI.app"

  zap trash: [
    "~/.sdkman-gui",
  ]

  caveats <<~EOS
    SDKMAN GUI requires SDKMAN to be installed first.
    If you haven't installed SDKMAN yet, run:
      curl -s "https://get.sdkman.io" | bash
  EOS
end