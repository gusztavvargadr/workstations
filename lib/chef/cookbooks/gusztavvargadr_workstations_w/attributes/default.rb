default['gusztavvargadr_windows']['chocolatey_packages'] = {
  'conemu' => {},
  'far' => {},
  'visualstudiocode' => {},
  'beyondcompare' => {},
  'googlechrome' => {},
  'git' => {
    'version' => '2.11.1.20170208',
    'options' => '-params \'"/GitAndUnixToolsOnPath"\'',
  },
  'nuget.commandline' => {},
}

default['gusztavvargadr_git']['profiles'] = {
  'https://github.com' => {
    'checkout_directory_path' => '/Users/vagrant/Repos',
    'repositories' => {
      'github/gitignore' => {},
    },
  },
  'https://github.com/gusztavvargadr' => {
    'username' => ENV['GIT_GITHUB_USERNAME'],
    'password' => ENV['GIT_GITHUB_PASSWORD'],
    'checkout_directory_path' => '/Users/vagrant/Repos/gusztavvargadr',
    'repositories' => {
      'home' => {},
    },
  },
}
