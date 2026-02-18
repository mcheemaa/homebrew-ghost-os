class GhostOs < Formula
  desc "Let AI agents see and control any app on your computer"
  homepage "https://github.com/mcheemaa/ghost-os"
  url "https://github.com/mcheemaa/ghost-os/releases/download/v0.1.4/ghost-os-0.1.4-macos-arm64.tar.gz"
  sha256 "7cdba6c6dfe517655f71bf3ebd7a2d3bef98d38b647ae2cd410c2194039bb698"
  license "MIT"
  version "0.1.4"

  depends_on :macos
  depends_on macos: :sonoma

  def install
    bin.install "ghost"
  end

  def caveats
    <<~EOS
      Ghost OS needs Accessibility permission for your terminal app.
      Run `ghost setup` to configure permissions and connect to Claude Code.

      Quick start:
        ghost setup
        # Start a new Claude Code session - your agent can now see your screen
    EOS
  end

  test do
    assert_match "Ghost OS", shell_output("#{bin}/ghost version")
  end
end
