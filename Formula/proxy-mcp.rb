class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "aeaa798ae39c2c93e6fa47ceb70c8865f58c6f82025a3b28465a206df4678834"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "a8be77a5e872c460efece198234ebd45347313b0607acd93b4ce5df4cdc34769"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "13612b40f9d163762d01f96dd3d2dae1631ae1f8b8cff012fd3f21be976e1d32"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "c103de433970d4c5d503abd527fef31769821814b62669312f5b42a238ae18bb"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp -version")
  end
end
