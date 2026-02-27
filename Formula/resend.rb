# typed: false
# frozen_string_literal: true

class Resend < Formula
  desc     "Resend CLI - send emails from your terminal"
  homepage "https://resend.com"
  version  "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-arm64.tar.gz"
      sha256 "e5b6329c886d5b6666c40626b6c605f137f3f60a04f2f583f270bd92322c2e14"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-x64.tar.gz"
      sha256 "8a9904a900755ae3ecb540ae538e59982c71761f0fb598b68cf0b5484b7a7a26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-arm64.tar.gz"
      sha256 "1a5b56ce070494694b596be15f696361dd92543af05c3330e192d1533cfd49da"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-x64.tar.gz"
      sha256 "c82afbd8e924a8236820b25291b79d79fa963e6841e17d4d83305cf0f1cab3dd"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version 2>&1")
  end
end
