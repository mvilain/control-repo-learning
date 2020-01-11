class minecraft {
  $url = 'https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar'
  $inst_dir = '/opt/minecraft'
 
  file{ $inst_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  
  notify { 'downloading...this may take a minute': 
  } ->
  file { "${inst_dir}/minecraft_server.jar":
    ensure  => file,
    source  => $url,
  }
  
  package { 'java':
    ensure  => present,
  }
  
  file { "${inst_dir}eula.txt":
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
    require => [ Package['java'], File['/etc/systemd/system/minecraft.service'], File["${inst_dir}eula.txt"], File["${inst_dir}/minecraft_server.jar"] ],
  }

}
