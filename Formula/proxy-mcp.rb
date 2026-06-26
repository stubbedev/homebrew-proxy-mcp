class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "f634dc9f111761fa77e9486edf26be68ac0d86b43721dfd4fbd9d442a66c1128"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "c17263a011a2d8bc199e9c0499a53993c2d90a01c9997e2aadee3c82438380e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "9014cf504be588ad95a2bd49c90223afc7c4b1eb9912ad2ec4cab04d92918a39"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "90c07d9ce59e4499f0b30d8386228d99d1e71b941f4ac94cc3000fa08abcec85"
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
