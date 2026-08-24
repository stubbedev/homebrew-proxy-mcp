class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "01d47882fedc89eaef6ed46879511d7d2d22050f70adf909f82c0b6851a1c808"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "96016a413b2b3e51381569784d91c6a6f5fb3f6c3a191d5804ef684eb564df47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "dad00674f5ac4d71128249bb0f9e395c9076b680b45adb2aaa259f52c8d166c7"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "85475c47de6407193dcce938176c32c32c0292ef5bbe85d59c1c31b8ebdc29af"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  service do
    run [opt_bin/"proxy-mcp", "--config", etc/"proxy-mcp/config.json"]
    keep_alive true
    log_path var/"log/proxy-mcp.log"
    error_log_path var/"log/proxy-mcp.log"
  end

  def caveats
    <<~EOS
      proxy-mcp's service reads a config from:
        #{etc}/proxy-mcp/config.json
      Create it first (see https://github.com/stubbedev/proxy-mcp#configuration), then:
        brew services start proxy-mcp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp --version")
  end
end
