# typed: false
# frozen_string_literal: true

class Resend < Formula
  desc     "Resend CLI - send emails from your terminal"
  homepage "https://resend.com"
  version  "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-arm64.tar.gz"
      sha256 "b6b82a0ced9cfc21a691352c6aa33e8f7b75add5e6d111087f108671cbe4e349"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-darwin-x64.tar.gz"
      sha256 "6e6ad146174332b06997f1a590aa56ed4c1781c612f7040cfa816e4eb16162e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-arm64.tar.gz"
      sha256 "2988e9a746871fddfe34111383a0a2f35682adfa095d4afe3601e938324231ca"
    end

    on_intel do
      url "https://github.com/rafa-thayto/homebrew-tap/releases/download/v#{version}/resend-linux-x64.tar.gz"
      sha256 "7f886e960ca2e8727ce7868b36a7752fb174043bce95e36232ac378b5f7c3244"
    end
  end

  def install
    bin.install "resend"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/resend --version 2>&1")
  end
end
