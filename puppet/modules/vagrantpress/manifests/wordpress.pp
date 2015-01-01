class vagrantpress::wordpress(
  $sites = hiera('sites')
){


  notify{"Set up WP sites": }

  ## CREATE VHOSTS BASED ON AVAILALBE SITES

  create_resources('vagrantpress::wordpress::site', $sites)


}

