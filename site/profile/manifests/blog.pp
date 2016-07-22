class profile::blog {
  # use these:
  #  - hunner/wordpress
  #  - puppetlabs/mysql
  #  - puppetlabs/apache
  #

  include apache
  include apache::mod::php

  class { '::mysql::server':
  }

  class { 'wordpress':
    install_dir => '/var/www/wordpress',
  }
}
