class devices::work {
  file { 'Projects directory':
    ensure => directory,
    path => '/home/jake/Projects',
    owner => 'jake'
  }
  -> vcsrepo { 'Vim runtime':
    ensure => latest,
    provider => git,
    user => 'jake',
    path => '/home/jake/Projects/dotfiles',
    source => 'git@github.com:dabapps/dotfiles',
  }
  -> file { 'DabApps dotfiles':
    ensure => link,
    owner => 'jake',
    target => '/home/jake/Projects/dotfiles/.editorconfig',
    path => '/home/jake/Projects/.editorconfig',
    mode => '0644'
  }
}
