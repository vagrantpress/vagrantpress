Puppet::Type.type(:site).provide(:ruby) do

  require 'fileutils'

  commands :wp => 'wp'

  WPCLI_URL= 'https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'

  def create
    STDOUT.puts "Install Wordpress Site"
    # Put together command (s).  We'll need to download sources first.


  end

  def destroy
    # No destroy.
  end

  def exists?
    return false
  end
end