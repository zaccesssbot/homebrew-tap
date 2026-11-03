# Homebrew formula template for Zacess Games. Replace 0.3.0 with the release version (without
# the v) and each SHA256_ placeholder with the sum from the matching .sha256 file on the release,
# then copy it to Formula/zacess-games.rb in the zacesshq/homebrew-tap repository.
class ZacessGames < Formula
  desc "Fourteen original games for the terminal in the Zacess high contrast themes"
  homepage "https://zacess.com"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zacesshq/games/releases/download/v0.3.0/zacess-games-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "d3949872d921a75cfb2e19d385472c7f7e27cc225d5d1b0a6722303d9bf09e93"
    end
    on_intel do
      url "https://github.com/zacesshq/games/releases/download/v0.3.0/zacess-games-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "7c40b8531f01062276cf43c5b31d2fcf2a9d0c5beae0769439503779e04bbe5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zacesshq/games/releases/download/v0.3.0/zacess-games-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "85535b244cef1cb7eeadd72b9d327e557f13c2497100ecc10e6bce40c8ad2d41"
    end
    on_intel do
      url "https://github.com/zacesshq/games/releases/download/v0.3.0/zacess-games-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a7229ddeebad2093e359377495ce1f40262e13a06390820781a6620118bcb3a8"
    end
  end

  def install
    bin.install "zacess-games"
  end

  test do
    assert_match "zacess-games", shell_output("#{bin}/zacess-games --version")
    ENV["ZACESS_GAMES_STATE"] = testpath/"state"
    system bin/"zacess-games", "--headless", "trace", "--keys", "right,enter", "--size", "60x20", "--theme", "deep-dark"
  end
end
