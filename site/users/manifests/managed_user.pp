define users::managed_user (
  $username,
) {
  user { $username:
    ensure => present,
  }

  file { '/home/${username}':
    ensure => directory,
    owner  => $username,
    group  => $username,
    mode   => '0755',
  }

  file { '/home/${username}/.ssh/':
    ensure => directory,
    owner  => $username,
    group  => $username,
    mode   => '0755',
  }

  file { 'ssh private key':
    ensure => file,
    path   => '/home/${username}/.ssh/id_rsa',
    owner  => $username,
    group  => $username,
    mode   => '0600',
  }

  file { 'ssh public key':
    ensure => file,
    path   => '/home/${username}/.ssh/id_rsa.pub',
    owner  => $username,
    group  => $username,
    mode   => '0644',
  }
}
