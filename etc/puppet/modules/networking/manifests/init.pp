class networking {
    package { 'inetutils-ping':
      ensure => 'installed',
    }
}
