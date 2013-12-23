# Install subversion

class subversion::install {
	package { 
		'subversion':
		ensure => present,
	}
}