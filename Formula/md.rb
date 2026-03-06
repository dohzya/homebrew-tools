class Md < Formula
  desc "Markdown surgeon - powerful markdown file manipulation tool"
  homepage "https://github.com/dohzya/tools"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dohzya/tools/releases/download/md-v0.7.0/md-darwin-arm64"
      sha256 "f31f232e7c7c43199b6aea5e584126d183072d32e31a3856a9b55a991800f263"
    elsif Hardware::CPU.intel?
      url "https://github.com/dohzya/tools/releases/download/md-v0.7.0/md-darwin-x86_64"
      sha256 "cd03f88398d30adcd0836b4cd777a393c618ce02c6e68efc045a7beaf5fe6252"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dohzya/tools/releases/download/md-v0.7.0/md-linux-arm64"
      sha256 "5753e70762ee983b01c1ecca919ecf1e55b3deea713c3b19d19260c6f3bdada4"
    elsif Hardware::CPU.intel?
      url "https://github.com/dohzya/tools/releases/download/md-v0.7.0/md-linux-x86_64"
      sha256 "5e3b19d2384ff580f489ba5e32334a199d642ef2bd32cfc97d7f51041e529245"
    end
  end

  def install
    # Determine which binary was downloaded based on platform
    binary_name = if OS.mac?
      if Hardware::CPU.arm?
        "md-darwin-arm64"
      else
        "md-darwin-x86_64"
      end
    else
      if Hardware::CPU.arm?
        "md-linux-arm64"
      else
        "md-linux-x86_64"
      end
    end

    bin.install binary_name => "md"
  end

  test do
    system "#{bin}/md", "--help"
  end
end
