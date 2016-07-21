class nginx {
  package { 'nginx':
    ensure => present,
  }

  file { 'nginx config':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }

  file { 'document root':
    ensure => directory,
    path   => '/var/www/',
    owner  => 'root',
    group  => 'root',
  }

  file { 'index':
    ensure => file,
    path   => '/var/www/index.html',
    source => 'puppet:///modules/nginx/index.html',
    owner  => 'root',
    group  => 'root',
  }

  file { 'site config':
    ensure  => file,
    path    => '/etc/nginx/conf.d/default.conf',
    source  => 'puppet:///modules/nginx/default.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['nginx config']
  }
}
