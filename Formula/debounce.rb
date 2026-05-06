class Debounce < Formula
  desc "Menu bar key debounce filter for macOS"
  homepage "https://github.com/rybkr/debounce"
  head "https://github.com/rybkr/debounce.git", branch: "main"

  depends_on :macos

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<~EOS
      Grant Accessibility access to:
        #{prefix}/Applications/Debounce.app
    EOS
  end

  test do
    assert_path_exists prefix/"Applications/Debounce.app"
    assert_path_exists bin/"debounce"
  end
end
