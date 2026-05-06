class Debounce < Formula
  desc "Menu bar key debounce filter for macOS"
  homepage "https://github.com/rybkr/debounce"
  url "https://github.com/rybkr/debounce.git",
      tag:      "v0.1.1",
      revision: "9ce090caaba5a5b063f1df58b52b07b36ba33764"

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
