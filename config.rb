# The VagrantPress Configuration File
$options={

   # THE BOX_FILE
   :box_file => 'hashicorp/precise64',
   :box_hostname => 'vagrantpress',

   # THE WEB SERVER TYPE
   :webserver => 'apache',

   # THE OS TYPE
   :final => true

}
# BOX_FILE:  The name of the box file that Vagrant will use.  There are a few 
# recommended for use with Vagrantpress, some of which already have the 
# necessary runtimes.

# OS FAMILY: