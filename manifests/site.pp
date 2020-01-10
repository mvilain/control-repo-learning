node default {
  file{ '/root/README.md':
    ensure  => file,
    content => '# root README.MD\n',
    owner   => 'root',
  }
}
