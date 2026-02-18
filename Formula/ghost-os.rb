class GhostOs < Formula
  desc "Let AI agents see and control any app on your computer"
  homepage "https://github.com/mcheemaa/ghost-os"
  url "https://github.com/mcheemaa/ghost-os/releases/download/v0.1.3/ghost-os-0.1.3-macos-arm64.tar.gz"
  sha256 "65c7870f9d654e7901fa2654fb378dec10a95922c041771a5876c94e68f300ba"
  license "MIT"
  version "0.1.3"

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
