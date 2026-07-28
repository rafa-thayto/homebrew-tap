cask "thaytool" do
  version "0.70.1"
  sha256 "85d87b4b0256f5a653e310d4d078857e06e86610085c1365634228adac23856d"

  url "https://assets.thaytool.com/releases/stable/v#{version}/Thaytool.dmg",
      verified: "assets.thaytool.com/"
  name "Thaytool"
  desc "Terminal-first local git worktree manager for coding agents"
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
