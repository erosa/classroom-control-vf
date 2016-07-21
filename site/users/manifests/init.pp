class users {
  user { 'fundamentals':
    ensure => present,
  }

  managed_user { 'bob':
    username => 'bob',
    ensure   => present,
  }

  managed_user { 'alice':
    username => 'alice',
    ensure   => present,
  }

  managed_user { 'chen':
    username => 'chen',
    ensure   => present,
  }
}
