cask "thaytool" do
  version "0.100.0"
  sha256 "2ea54184deccac87efd82b6c852575982e0a0531ffeb3e3d3108552234a8cab4"

  url "https://assets.thaytool.com/releases/stable/v#{version}/Thaytool.dmg"
  name "Thaytool"
  desc "Git worktree workspaces with persistent terminals for Claude Code and Codex"
  homepage "https://thaytool.com/"

  livecheck do
    url "https://assets.thaytool.com/appcast.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.blank? }&.short_version
    end
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Thaytool.app"
  # The bundled Control CLI (Contents/Helpers/thaytool, #110): brew links it into its bin
  # so `thaytool` is on PATH after `brew install thaytool`. The link points INTO the .app,
  # so Sparkle's in-place updates keep it valid — same target as the in-app Install command.
  binary "#{appdir}/Thaytool.app/Contents/Helpers/thaytool"

  uninstall quit: "com.thaytool.app"

  zap trash: [
    "~/.thaytool",
    "~/Library/Application Support/Thaytool",
    "~/Library/Caches/com.thaytool.app",
    "~/Library/HTTPStorages/com.thaytool.app",
    "~/Library/Preferences/com.thaytool.app.plist",
  ]
end
