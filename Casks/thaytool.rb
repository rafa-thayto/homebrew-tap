cask "thaytool" do
  version "0.94.0"
  sha256 "b00ac33c9da56cba5e5ee4f9fb0e27e098eafa5a0b9df453f0f50d3d1189e71f"

  url "https://assets.thaytool.com/releases/stable/v#{version}/Thaytool.dmg"
  name "Thaytool"
  desc "Git worktree workspaces with persistent terminals for Claude Code and Codex"
  homepage "https://thaytool.com/"

  livecheck do
    url "https://assets.thaytool.com/appcast.xml"
    strategy :sparkle do |items|
      items.find { |item| item.channel.blank? }&.bundle_version&.nice_version
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
