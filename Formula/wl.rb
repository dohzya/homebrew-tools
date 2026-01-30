class Wl < Formula
  desc "Worklog - track work progress during development sessions"
  homepage "https://github.com/dohzya/tools"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dohzya/tools/releases/download/wl-v0.4.4/wl-darwin-arm64"
      sha256 "9a524a6c845414425592578979d9255e65aa45f262328b60bf7e929a77920668"
    elsif Hardware::CPU.intel?
      url "https://github.com/dohzya/tools/releases/download/wl-v0.4.4/wl-darwin-x86_64"
      sha256 "469ae671f187d051d2d05e8e3a3a8bca9e94ee3fbebafdbf6461e6be8ce6ce1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dohzya/tools/releases/download/wl-v0.4.4/wl-linux-arm64"
      sha256 "35d347e4cd76dd256139999dfea322fb4b264fb0012df9ef0d39f25a04968077"
    elsif Hardware::CPU.intel?
      url "https://github.com/dohzya/tools/releases/download/wl-v0.4.4/wl-linux-x86_64"
      sha256 "0f6338aa353b5012de18687916cb943ee492d2ed16730e505eaa0465be8a9742"
    end
  end

  def install
    # Determine which binary was downloaded based on platform
    binary_name = if OS.mac?
      if Hardware::CPU.arm?
        "wl-darwin-arm64"
      else
        "wl-darwin-x86_64"
      end
    else
      if Hardware::CPU.arm?
        "wl-linux-arm64"
      else
        "wl-linux-x86_64"
      end
    end

    bin.install binary_name => "wl"
  end

  test do
    system "#{bin}/wl", "--help"
  end
end
