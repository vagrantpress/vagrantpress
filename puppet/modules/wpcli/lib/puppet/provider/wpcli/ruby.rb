Puppet::Type.type(:wpcli).provide(:ruby) do

  require 'fileutils'

  commands :curlcmd => 'curl'

  WPCLI_URL= 'https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'

  def create
    STDOUT.puts "INSTALL WP-CLI"
    # Download the appropriate file to /usr/local/bin/wp
    `curl #{WPCLI_URL} > /usr/local/bin/wp`

    # Change permissions to executable.
    FileUtils.chmod 0755, '/usr/local/bin/wp', :verbose => true


  end

  def destroy
    # No destroy.
  end

  def exists?
    # Look for the executable
    return false
  end
end