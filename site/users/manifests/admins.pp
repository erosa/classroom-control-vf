class admins {
  managed_user { 'bob':
    username => 'bob',
  }

  managed_user { 'alice':
    username => 'alice',
  }

  managed_user { 'chen':
    username => 'chen',
  }
}
