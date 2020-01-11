class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar',
  $install_dir = '/opt/minecraft'
) {
  file{ $install_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
  }
  
  notify { 'downloading jar...this may take a minute': 
  } ->
  file { "${install_dir}/minecraft_server.jar":
    ensure  => file,
    source  => $url,
  }
  
  package { 'java':
    ensure  => present,
  }
  
  file { "${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true',
  }
  
  file { '/etc/systemd/system/minecraft.service':
    ensure  => file,
    content => template('minecraft/minecraft.service.erb'),
    #content => epp('minecraft/minecraft.service',{ 
    #  install_dir => $install_dir
    #} )
  }
  
  service { 'minecraft':
    ensure  => running,
    enable  => true,
    require => [ 
      Package['java'], 
      File[ '/etc/systemd/system/minecraft.service' ], 
      File[ "${install_dir}/eula.txt" ], 
      File[ "${install_dir}/minecraft_server.jar" ], 
    ],
  }

}
