cask "thaytool" do
  version "0.78.0"
  sha256 "9d17494278a05a408d0ff295c65b7895063779aba9c63c7cf3eef30c397e0b3f"

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
