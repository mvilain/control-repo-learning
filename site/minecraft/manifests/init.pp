class minecraft {
  file{ '/opt/minecraft':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  
  notify { 'downloading...this may take a minute': 
  } ->
  file { '/opt/minecraft/minecraft_server.jar':
    ensure  => file,
    source  => 'https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar',
  }
  
  package { 'java':
    ensure  => present,
  }
  
  file { '/opt/minecraft/eula.txt':
    ensure  => file,
    content => 'eula=true',
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    source  => 'puppet:///modules/minecraft/minecraft.service',
    require => Package['java'],
  }
  
  service { 'minecraft':
    ensure  => running,
    enable  => true,
    require => [ Package['java'], File['/etc/systemd/system/minecraft.service'] ],
  }

}
