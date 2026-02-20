# typed: false
# frozen_string_literal: true

class Resend < Formula
  desc     "Resend CLI - send emails from your terminal"
  homepage "https://resend.com"
  version  "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-arm64.tar.gz"
      sha256 "834e0bf3e4948af5f0a4cecc01f47934868370db47660af0531b63622fb92758"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-x64.tar.gz"
      sha256 "eeb9233aa84598c5e23cb6fe26ed4fe23858503c4c57d2c0a4cce0691ccde3b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-arm64.tar.gz"
      sha256 "de93f0d7d2a1a35c3d8d7093c42d53bf525253dc36f6b408955d6b1d86354d77"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-x64.tar.gz"
      sha256 "16c3add31f2c8eec9d43dd1383e6936418ea5c44c6f1c90b34dc00e1bf2789f2"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version 2>&1")
  end
end
