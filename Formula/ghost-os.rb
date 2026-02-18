class GhostOs < Formula
  desc "Let AI agents see and control any app on your computer"
  homepage "https://github.com/mcheemaa/ghost-os"
  url "https://github.com/mcheemaa/ghost-os/releases/download/v0.1.2/ghost-os-0.1.2-macos-arm64.tar.gz"
  sha256 "06d7a5e338e90b4362a4d3da8d6cde452c880a32eaf14db487c55283990c0ca2"
  license "MIT"
  version "0.1.2"

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
