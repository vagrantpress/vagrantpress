# VagrantPress

*VagrantPress* is a packaged development environment for developing WordPress themes and modules.  
I initially created this project to aid in developing child modules for a WordPress blog.

# What's Installed

+ Ubuntu Precise (12.04)
+ Wordpress 3.8
+ Mysql
+ Php
+ Phpmyadmin
+ Subversion
+ PEAR
+ Xdebug
+ PHPUnit
+ phploc
+ phpcpd
+ phpdcd
+ phpcs
+ phpdepend
+ phpmd
+ PHP_CodeBrowser
+ WordPress sniffs for phpcs
+ WordPress Unit Tests

## Development Branch RoadMap

**NOTE**: This roadmap is definitely open to discussion.  I'm going

As this is the 'development' branch, you'll notice a few things are different here.  In particular,
I'm doing a couple of different things to the codebase.  My roadmap for a few of these changes:

1.  Updating the puppet portions of the project to fit into puppet best practices, using forge
    modules.  As such, you'll note that `librarian-puppet` will be installed into the virtual machine.
1.  Wordpress provisioning and operations will use a module that is built around the [wp-cli project][wpcli].
    WP-CLI is an incredibly rich toolkit that I would like to leverage in provisioning - mainly for the
    practical reason of the massive development efforts in that project. Leveraging that work would be
    vastly more useful than re-implementing using puppet `exec` calls.
1.  I want to tie the development environment here with the option for creating / contributing to real
    deployment environments.  The strength of the vagrant/puppet approach to development environments is
    that your development environment can mimic production environments 'better' than approaches like
    local PHP installs, MAMP, etc.  While doing all of this work in vagrant, why not make packaging your
    environment into a re-deployable unit using puppet or docker on production systems?  I want to make
    that transition easier than it is in the project today.

... and along with all of that, when I'm ready with the dev branch I will cut a 'release' of the current
state of the project so users can continue to fork it if they wish.  In the end, I don't want to remove
functionality but rather have a better base to add more and better functionality.

## Project roadmaps

1.  With the 'completion' of the development branch, I am going to transfer this project from my own personal
    account to the 'Vagrantpress' organization.  That will make the project a little more visible and
    hopefully will emphasize the community-driven aspect of the project a little more.  (I do really appreciate
    the help I've received, the feedback I've gotten from users and the many, many forks of the project created
    by people that have found this project to be a good starting spot for their own workflows.
1.  I want to set up a users list so that getting help and using the project is a little easier.  I do appreciate
    that people are resourceful enough to find me on my personal web page, etc. - getting help ought to be
    a little easier than that.


## Getting Started

This is a fairly simple project to get up and running.  
The procedure for starting up a working WordPress is as follows:

1. Clone the project.  (There’s only master branch.)
2. Run the command `vagrant up`
3. Open your browser to http://localhost:8080

## Working with the environment

To log in to the local Wordpress installation:

`http://localhost:8080/wp-admin/` the username is `admin`, the password is `vagrant`.

You can access phpMyAdmin:

`http://localhost:8080/phpmyadmin/` with username `wordpress`, password `wordpress`.

## A Few Details

* If you're needing a password (for anything - including mysql, it should be `vagrant`)

## Getting Help

Feel free to file an issue, create a pull request, or contact me at [my website][chadthompson].

[chadthompson]: http://chadthompson.me
[wpcli]:  http://wp-cli.org
