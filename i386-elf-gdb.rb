require 'formula'

class I386ElfGdb < Formula
  homepage 'http://www.gnu.org/software/gdb/'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-7.10.0.tar.xz'
  sha256 '605954d5747d5f08ea4b7f48e958d1ebbf39265e18f7f36738deeabb83744485'

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install
    # ENV['CC'] = '/usr/local/bin/gcc-5.2'
    # ENV['CXX'] = '/usr/local/bin/g++-5.2'
    # ENV['CPP'] = '/usr/local/bin/cpp-5.2'
    # ENV['LD'] = '/usr/local/bin/gcc-5.2'

    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", '--disable-werror'
      system 'make'
      system 'make install'
      #FileUtils.rm_rf share/"locale"
      #FileUtils.mv lib, libexec
    end
  end
end
