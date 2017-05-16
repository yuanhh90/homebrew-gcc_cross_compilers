require 'formula'

class I386ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz'
  sha256 '7909a08eabdbaac0f7a22e9ede82a66ba70acd50629b045e705af864eef10b65'

  depends_on 'gcc52' => :build

  def install
    ENV['CC'] = '/opt/local/gcc-5.2'
    ENV['CXX'] = '/opt/local/g++-5.2'
    ENV['CPP'] = '/opt/local/cpp-5.2'
    ENV['LD'] = '/opt/local/gcc-5.2'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-elf',
                             '--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
      FileUtils.mv lib, libexec
    end
  end

end
