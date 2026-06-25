class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "25f028d0d2f561755c70566240ff90d715bfdc0a1a1cf4e4f45db7ff932bcf5e"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "4de103e8dd14280f5068f933b23547e5dbe427f782f067344ac018eda6ed6995"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "17469670cba6511205fa390f8baf38c0a6fd35d1ac20e74138f6fa46e7bfd9c9"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "bd93ad796632f12cf6b5d2eab56ff25417a203a776429dbb6eb6f2de4cf077f0"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp -version")
  end
end
