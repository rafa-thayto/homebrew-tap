cask "thaytool" do
  version "0.92.0"
  sha256 "c91f745cc6c92a4978194cfafc6bdd7d30812a97c3a675af4ea68a1037958c50"

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

  uninstall quit: "com.thaytool.app"

  zap trash: [
    "~/.thaytool",
    "~/Library/Application Support/Thaytool",
    "~/Library/Caches/com.thaytool.app",
    "~/Library/HTTPStorages/com.thaytool.app",
    "~/Library/Preferences/com.thaytool.app.plist",
  ]
end
