cask "sdkman-gui" do
  version "1.0.0"
  sha256 :no_check # 在正式发布时需要替换为实际的 SHA256

  url "https://github.com/youngledo/sdkman-gui/releases/download/v#{version}/sdkman-gui_#{version}_arm64.dmg",
      verified: "github.com/youngledo/sdkman-gui"
  name "SDKMAN GUI"
  desc "Modern graphical management tool for SDKMAN."
  homepage "https://github.com/youngledo/sdkman-gui"

  livecheck do
    url :url
    strategy :github_latest
  end

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
