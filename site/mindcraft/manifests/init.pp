class minecraft {
  file{ '/opt/mindcraft':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  
  file { '/opt/mindcraft/mindcraft_server.jar':
    ensure  => file,
    source  => 'https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar',
  }
  
  package { 'java':
    ensure  => present,
  }
  
  file { '/opt/mindcraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
  }
  
  file { 'etc/systemd/system/mindcraft.service':
    ensure => file,
    source => 'puppet:///modules/mindcraft/mindcraft.service',
  }
  
  service { 'mindcraft':
    ensure  => running,
    enabled => true,
  }

}
