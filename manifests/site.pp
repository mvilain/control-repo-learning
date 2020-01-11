node default {
}

node 'master.puppet.vm' {
  include role::master_server
  
  file { '/root/README.md':
    ensure  => file,
    content => "# Welcome to ${fqdn}\n",
  }
  host { 'web':
    ip  => '172.18.0.2',
  }
  host { 'db':
    ip  => '172.18.0.3',
  }
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}
