class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "61a11d9bde6426aed63c985dfc696bb5e05d7fde6f226a642d57d62e0e9535f6"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "bcd504aecbd0b60e679e8c7592e0df22ae97dc70609aad22a249799e74fdd02e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "520505d863cf61e683b63417637e96c4769ceba1c080bbd9e4663e5da4218a94"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "79d1bfc9741159e23ef97e1663903977beb7716ce647dbfd3c6770f2ca7380e5"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp --version")
  end
end
