Puppet::Type.type(:wpcli).provide(:ruby) do


  def create
    STDOUT.puts "INSTALL WP-CLI"
  end

  def destroy
    # No destroy.
  end

  def exists?
    return false
  end
end