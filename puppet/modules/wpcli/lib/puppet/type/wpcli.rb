Puppet::Type.newtype(:wpcli) do
  @doc = "Install and verify installation of the WP-CLI tool."
  ensurable

  newparam(:path, :namevar => true) do
   desc "Path to install wp"
  end

end