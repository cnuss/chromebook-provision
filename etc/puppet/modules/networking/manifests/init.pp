class networking {
    package { 'inetutils-ping':
      ensure => 'installed',
    }

    package { 'dnsutils':
      ensure => 'installed',
    }
}
