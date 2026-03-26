class Gitvista < Formula
  desc "Real-time local Git repository visualization"
  homepage "https://gitvista.io"
  url "https://github.com/rybkr/gitvista/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "cc2223980f10441ea9e5527305521df53543e9f3c4e4e19b81fded182738097e"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
    ]

    system "go", "build",
        *std_go_args(ldflags: ldflags, output: bin/"gitvista"),
        "./cmd/vista"

    bin.install_symlink bin/"gitvista" => "git-vista"
  end

  test do
    assert_match "GitVista", shell_output("#{bin}/gitvista help")
    assert_match "GitVista", shell_output("#{bin}/git-vista help")
  end
end
