class profile::ssh_server {
  package {'openssh-server':
    ensure => present,
  }
  service { 'sshd':
    ensure  => 'running',
    enable  => 'true',
    require => Package[ 'openssh-server' ],
  }
  ssh_authorized_key { 'root@master.puppet.vm':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDS5+ZMgWCDG8CqrdlWHHPzVGrokgnCZdtvbR8KLyUUN+rdCt/N0bBG9lQ8K4IcjrcoJEImpYp7UEqtpgO+JVSNiZFZpc7V8A29E+2wBrCDnLF2vsaS90II4aqJJKMl+6wxZ+OanaKLm6rVN8BOYBf47C3nZXAxgwPvHWinayMNySbADKodKtKQNbOwFS7IILhHM03vwFJTTInKm37p/W9Gwn9YWJyXnjfek1J6fD2HHt1dqZ0G7IKs/LIHzbDie9fatQzW020oYjNIKI8SEhobZsg7tmIF6U/bkEL9nsMeHCvnPk2VLpZ3SMIdifeCaFoBeC1OuiYPqBuZE1gYEGY3',
#    subscribe => Service[ 'sshd' ],
  }  
}
