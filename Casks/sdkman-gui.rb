cask "sdkman-gui" do
  arch arm: "arm64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "7b4a80724e42fc34a4cdd22a76f899f9ca522f8dd7c5416c7f48d4c0597e5223",
         intel: "0a7162e705d00266b061ea649285b7692eeaf3ff78b862223968c9acb7153250"

  url "https://github.com/youngledo/sdkman-gui/releases/download/v#{version}/sdkman-gui_#{version}_#{arch}.dmg",
      verified: "github.com/youngledo/sdkman-gui"
  name "SDKMAN GUI"
  desc "Cross-platform, supports Windows, macOS, Ubuntu. Built with JavaFX + Maven, inspired by Applite's design aesthetic, offering an elegant GUI interface for SDKMAN."
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