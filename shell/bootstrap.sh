#!/bin/sh

# This script is modified from purple52's install script. See
# https://github.com/purple52/librarian-puppet-vagrant/blob/master/shell/main.sh
# For more detail and instructions on how you might adapt this script.

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR=/etc/puppet/

# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum

# Execute System Updates for recent packages.
    $(which apt-get > /dev/null 2>&1)
      FOUND_APT=$?
    $(which yum > /dev/null 2>&1)
      FOUND_YUM=$?

     if [ "${FOUND_YUM}" -eq '0' ]; then
        yum -q -y makecache
      elif [ "${FOUND_APT}" -eq '0' ]; then
        apt-get -q -y update
      else
        echo 'No package installer available..'
      fi

#  Check for puppet install

    if hash puppet >/dev/null; then
        echo "*** Don't install puppet "
    else
        echo "*** Install Puppet "     # Need to do some OS-specific installs here.
                                       # For Development, assume Ubuntu / Precise 64
        cd /tmp/; wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
        cd /tmp/; dpkg -i puppetlabs-release-precise.deb

    fi

# Check for Git Install
    $(which git > /dev/null 2>&1)
    FOUND_GIT=$?
    if [ "$FOUND_GIT" -ne '0' ]; then
      echo 'Attempting to install git.'

      if [ "${FOUND_YUM}" -eq '0' ]; then
        yum -q -y install git
        echo 'git installed.'
      elif [ "${FOUND_APT}" -eq '0' ]; then
        apt-get -q -y install git
        echo 'git installed.'
      else
        echo 'No package installer available. You may need to install git manually.'
      fi
    else
      echo 'git found.'
    fi

# Look for Puppet Directory and librarian-puppet

if [ ! -d "$PUPPET_DIR" ]; then
  mkdir -p $PUPPET_DIR
fi

# Link hiera.yaml to the puppet version
if [ ! -L /etc/hiera.yaml ]; then
  ln -s /vagrant/puppet/hiera.yaml /etc/hiera.yaml
fi


cp /vagrant/puppet/Puppetfile $PUPPET_DIR
if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  gem install librarian-puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi