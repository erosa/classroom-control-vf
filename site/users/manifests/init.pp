class users {
  user { 'fundamentals':
    ensure => present,
  }

  users::managed_user { 'bob':
    username => 'bob',
    ensure   => present,
  }

  users::managed_user { 'alice':
    username => 'alice',
    ensure   => present,
  }

  users::managed_user { 'chen':
    username => 'chen',
    ensure   => present,
  }
}
