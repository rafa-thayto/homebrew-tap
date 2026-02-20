# typed: false
# frozen_string_literal: true

class Resend < Formula
  desc     "Resend CLI - send emails from your terminal"
  homepage "https://resend.com"
  version  "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-arm64.tar.gz"
      sha256 "d8b43adc0ed0bbf343b8e7a8013c332aab36c9aefd59361cadbd278661c57b36"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-x64.tar.gz"
      sha256 "427e639cfe25f0a3da9c7334b7b92ec5ad3d7b2b93dd177dc54c24944ab4fb32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-arm64.tar.gz"
      sha256 "d6aae33dec5d29988d8c868e67e8ddbaec3a819b74248dfd182d4625001eefd0"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-x64.tar.gz"
      sha256 "b3a10318a96c9c4f70368ce96e1662b3b45e16eeff420d600bf4b98b24ce202f"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version 2>&1")
  end
end
