class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "6979b0f2770a182c3de56e78c40679e67c0b24e482dcaabdc69e7e0b234d2520"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "a2521b2a2166dbee5fede1419decbe473a19f9290c9546f9822cd7b2cc1af5af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "dd602331e69c5aa43b813be986a0bfae14cf0d7dd4003dbe25240984fd5fe5d8"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "969e37f56a4847bddc7cdade6eec4eb6c32650d3b4660f9688f97a2376ef50e6"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp --version")
  end
end
