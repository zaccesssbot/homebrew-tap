# Homebrew formula for Zacess Scenes 0.6.0, for Formula/zacess-scenes.rb in the zacesshq/homebrew-tap
# repository. Each SHA256_ placeholder is the sum from the matching .sha256 file attached to the
# v0.6.0 release; packaging/fill-checksums.sh fills them in. The next release changes the version
# in the four URLs and the four sums.
class ZacessScenes < Formula
  desc "Calm animated scenes for the terminal in the Zacess high contrast themes"
  homepage "https://zacess.com"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zacesshq/scenes/releases/download/v0.6.0/zacess-scenes-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "0904a00892a719596205fbef1b1b11ecd99b804ee3cb597bdb8b3888b7bfa8ab"
    end
    on_intel do
      url "https://github.com/zacesshq/scenes/releases/download/v0.6.0/zacess-scenes-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "c27323c903a4be787047e8b3ebb54b151f6515f911447c938d835801aa3c58b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zacesshq/scenes/releases/download/v0.6.0/zacess-scenes-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "58c90e8fc3c2708ef86e8dc19b469fc109218a32c0e5981a02a4b468a491b655"
    end
    on_intel do
      url "https://github.com/zacesshq/scenes/releases/download/v0.6.0/zacess-scenes-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e2edeb3fa1b079b3f592e1d0d4e4db0c845b74fa14f31d12264f0744217d6310"
    end
  end

  def install
    bin.install "zacess-scenes"
    doc.install "README.md", "CHANGELOG.md", "ACCESSIBILITY.md", "NOTICE.md"
  end

  test do
    assert_match "zacess-scenes #{version}", shell_output("#{bin}/zacess-scenes --version")
    system bin/"zacess-scenes", "sea", "--headless", "--frames", "1", "--size", "20x8", "--theme", "deep-dark"
  end
end
