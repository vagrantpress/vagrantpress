Puppet::Type.newtype(:site) do
  @doc = "Install and verify installation of a Wordpress site."
  ensurable

  newparam(:path, :namevar => true) do
    desc "Path to install wp"
  end

end