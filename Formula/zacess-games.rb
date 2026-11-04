# Homebrew formula for Zacess Games 0.4.0, for Formula/zacess-games.rb in the zacesshq/homebrew-tap
# repository. Each SHA256_ placeholder is the sum from the matching .sha256 file attached to the
# v0.4.0 release; packaging/fill-checksums.sh fills them in. The next release changes the version
# in the four URLs and the four sums.
class ZacessGames < Formula
  desc "Fourteen original games for the terminal in the Zacess high contrast themes"
  homepage "https://zacess.com"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zacesshq/games/releases/download/v0.4.0/zacess-games-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "4dc486e69111e34cb290763e4081ea2990f2fd6ba094dde5e6931f6b44f089bd"
    end
    on_intel do
      url "https://github.com/zacesshq/games/releases/download/v0.4.0/zacess-games-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "e24d5540ead719ff261a1587ca6fe1e7fe35e65f3258ad3cb27ca89076e7705a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zacesshq/games/releases/download/v0.4.0/zacess-games-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d01d45e858d8e73f6f7f3eba5c67a5a9152caf27ddca6ca03a52dc54f97c34a7"
    end
    on_intel do
      url "https://github.com/zacesshq/games/releases/download/v0.4.0/zacess-games-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6de256b648b18181a410333727f71a6aeae1d6d339acf0387eeb425abff7e0a6"
    end
  end

  def install
    bin.install "zacess-games"
    doc.install "README.md", "CHANGELOG.md", "ACCESSIBILITY.md", "NOTICE.md"
  end

  test do
    assert_match "zacess-games #{version}", shell_output("#{bin}/zacess-games --version")
    ENV["ZACESS_GAMES_STATE"] = testpath/"state"
    system bin/"zacess-games", "--headless", "trace", "--keys", "right,enter",
           "--size", "60x20", "--theme", "deep-dark"
  end
end
