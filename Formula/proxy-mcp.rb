class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.23"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "d5c8f07e7b718eebb89ad95747136e850cd4d7b332b7e91b696e33a35ddb8138"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "b3d4017b152bab52dc7c3e617195ce8e54659afb95e425fc4400287805137f9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "0f744a42b081da6feac6ebca786bd4b8dcc452f65b2e5a77a37831c2523744c9"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "5120dbebceebb7f7ca16e7ce1f9c1b525ec30f9ad27b2bd19638e8c6ca6c24dd"
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
