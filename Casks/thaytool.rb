cask "thaytool" do
  version "0.58.0"
  sha256 "5f02bcfc1c451557f7c5edfb22de2f1026c6c5842d18ca1b0b141467f6b45db1"

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
