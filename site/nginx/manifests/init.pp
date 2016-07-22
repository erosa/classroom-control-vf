class nginx {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  package { 'nginx':
    name   => $facts['operatingsystem'] ? {
      'windows' => 'nginx-service',
      default   => 'nginx',
    },
    ensure => present,
  }

  file { 'nginx config':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    source  => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
  }

  file { 'document root':
    ensure => directory,
    path   => '/var/www/',
  }

  file { 'index':
    ensure => file,
    path   => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
  }

  file { 'site config':
    ensure  => file,
    path    => '/etc/nginx/conf.d/default.conf',
    source  => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['nginx config']
  }
}
