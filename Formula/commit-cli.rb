class CommitCli < Formula
  desc "Write and organize git commits with a coding-agent CLI"
  homepage "https://github.com/saadjs/commit-cli"
  url "https://github.com/saadjs/commit-cli/releases/download/v0.1.2/commit-cli-0.1.2.tgz"
  sha256 "894335a8df66fefeb6eb199a542bdc26aa7fba56f0299dbda1ef44fa84b27a75"
  version "0.1.2"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "dist", "node_modules", "package.json"
    (bin/"commit").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/cli.js" "$@"
    EOS
  end

  def caveats
    <<~EOS
      commit drives a coding-agent CLI, so you need at least one of these on your PATH:
        claude (default), codex, opencode, pi

      Check what it can see with:
        commit --providers
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/commit --version")
    assert_match "claude", shell_output("#{bin}/commit --providers")
    assert_match "not a git repository", shell_output("#{bin}/commit 2>&1", 1)
  end
end
