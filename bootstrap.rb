class BaseBootstrap
  def self.check_puppet

    if `which puppet`.empty?
        puts "NO PUPPET - INSTALL"
    else
      puppetversion = `puppet --version`
      if puppetversion.to_f < 3.4

        puts "UPDATE PUPPET from #{puppetversion}"
        if !File.exist?('/tmp/puppetlabs-release-precise.deb')
          `wget -P /tmp/ https://apt.puppetlabs.com/puppetlabs-release-precise.deb`
        end

        `dpkg -i /tmp/puppetlabs-release-precise.deb`
        `apt-get update`
        `apt-get install puppet -y`

        puts `puppet --version`

      end
    end


  end
end


# Steps For Bootstrapping the instance
begin
  BaseBootstrap.check_puppet
end





