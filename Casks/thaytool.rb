cask "thaytool" do
  version "0.96.0"
  sha256 "9924b7918d99f15fd4c434f486f8d59e7df7b864456984a2e24d1f1cd49f5b2d"

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
