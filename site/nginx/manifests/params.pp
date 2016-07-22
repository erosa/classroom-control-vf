class nginx::params {
  case $::osfamily {
    'Windows': {
      $docroot = 'C:/ProgramData/nginx'
    }
    'RedHat': {
      $docroot = '/var/www'
    }
    default: {
      fail("Module is not supported on ${::osfamily}")
    }
}
