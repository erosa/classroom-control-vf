class nginx (
  $docroot = '/var/www',
) {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  package { 'nginx':
    ensure => present,
  }

  file { 'nginx config':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    source  => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
  }

  file { 'document root':
    ensure => directory,
    path   => $docroot,
  }

  file { 'index':
    ensure => file,
    path   => "${docroot}/index.html",
    source => 'puppet:///modules/nginx/index.html',
  }

  file { 'site config':
    ensure  => file,
    path    => '/etc/nginx/conf.d/default.conf',
    content => template('nginx/default.conf.erb'),
    require => Package['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['nginx config']
  }
}
