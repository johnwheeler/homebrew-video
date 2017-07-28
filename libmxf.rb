require "formula"

class Libmxf < Formula
  homepage "http://sourceforge.net/p/bmxlib/home/Home/"
  url "https://downloads.sourceforge.net/project/bmxlib/bmx-snapshot-20170117/bmx-snapshot-20170117.tar.gz"
  sha256 "fdaaf43f60f916c76c2c9b956c05466ac41f5dc23a926c258611acfb7d557c7a"

  # does not build with superenv
  env :std

  depends_on "pkg-config" => :build
  depends_on "libtool" => :build

  def install
    Dir.chdir "libmxf"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-examples",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
