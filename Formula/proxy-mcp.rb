class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "aca9458023699d9e6a51b8b6837cc753e61541b26cf5684938d5a946d421a448"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "5504953e40f70c2afb3b380ccd76ea65a80e7235217e25cdad028a74771245d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "cc0fc211c3583c121392202b2fca5d6b66dd194436cfb5640a5c228ceec3d2ce"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "94e983852d43d443eaddafe9a8bccf00983b94601fbf17a85b22fe0f349ef1b2"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp --version")
  end
end
