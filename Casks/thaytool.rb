cask "thaytool" do
  version "0.53.0"
  sha256 "4675692543c2bc321e7ced164f9e963a053f514eef37e95b347a28fa320e1a47"

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
