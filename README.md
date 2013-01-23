# VagrantPress

*VagrantPress* is a packaged development environment for developing WordPress themes and modules.  I initially created this project to aid in developing child modules for a WordPress blog.

## Getting Started

This is a fairly simple project to get up and running.  The procedure for starting up a working WordPress is as follows:

1. Clone the project.  (There’s only master branch.)
2. Run the command `vagrant up`
3. Open your browser to http://localhost:8080

You’ll note that a copy of WordPress v. 3.5 has also been copied to the directory where you ran the `vagrant up` command - this is what is being served from the virtual environment.

## A Few Details

* I’m running this on a local ‘box’ (working on importing this one to S3) of Ubuntu 12.04LTS 64-bit.  This might be a bit full blown for a development environment - feel free to edit the Vagrantfile to include any other box you may have.  (My goal is to get a ‘real’ box loaded to S3 so the install/run is seamless.)

* The scripts are my first ‘real’ puppet project.  There are a few items that I’d like to make smaller and more network efficient.  (e.g. - maybe not cloning the entire WordPress repo would be helpful.)


## Getting Help

Feel free to file an issue, create a pull request, or contact me at [my website][chadthompson].

[chadthompson]: http://chadthompson.me