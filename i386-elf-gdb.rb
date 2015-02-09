require 'formula'

class I386ElfGdb < Formula
  homepage 'http://www.gnu.org/software/gdb/'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-7.8.2.tar.xz'
  md5 'a80cf252ed2e775d4e4533341bbf2459'

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install
    # ENV['CC'] = '/usr/local/bin/gcc-4.9'
    # ENV['CXX'] = '/usr/local/bin/g++-4.9'
    # ENV['CPP'] = '/usr/local/bin/cpp-4.9'
    # ENV['LD'] = '/usr/local/bin/gcc-4.9'

    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", '--disable-werror'
      system 'make'
      system 'make install'
      #FileUtils.rm_rf share/"locale"
      #FileUtils.mv lib, libexec
    end
  end
end
