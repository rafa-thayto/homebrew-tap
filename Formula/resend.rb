# typed: false
# frozen_string_literal: true

class Resend < Formula
  desc     "Resend CLI - send emails from your terminal"
  homepage "https://resend.com"
  version  "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-arm64.tar.gz"
      sha256 "cc7efeb49810b056512b213c5bbf17157242f21d24a3fd4ccec5bb1d74259f5e"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-x64.tar.gz"
      sha256 "82d3d5ca75857a59f725d54afda0823efd90c651ccb482f95936c34c86da25e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-arm64.tar.gz"
      sha256 "1a3cde2938fae7b86945c408097799a6d3f22df4ba9df139db0b2ebaaff8c8c8"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-x64.tar.gz"
      sha256 "c17b39cf693e091d6ffae796238f80948d9caf3b3bb3390101a5624bfbe878bc"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version 2>&1")
  end
end
