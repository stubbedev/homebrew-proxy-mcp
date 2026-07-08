class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "f16935b53f4599e11d764f15292bacc3b750499d1387e1b20ccddd0b806343a3"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "91beee6579495d5e65529a813630aeaf8309006aaa9d623bb07c7d0ba5c70f82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "05fab7af0c01ac62525ef12da69f55116c61cb3ef5a9952c8159628683ad9134"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "0b5d4a57c4478bb9bc86180fa1d85e81ef596d0f5124a670024b23b2085bc8d4"
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
