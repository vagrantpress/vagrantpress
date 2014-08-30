class vagrantpress::wordpress(
  $sites = hiera('sites')
){


  notify{"Set up WP sites": }

  ## READ VHOST SETTINGS FROM HIERA FILE
  site{"${sites}": }





  ## CREATE VHOSTS BASED ON AVAILALBE SITES


}

define site(

){

    notify{"Create site": }
}