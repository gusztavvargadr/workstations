default['gusztavvargadr_workstations_dockerc'] = {
  'requirements' => {},
  'tools' => {
    'windows' => {
      'Docker for Windows (Edge)' => {
        'source' => 'https://download.docker.com/win/edge/Docker%20for%20Windows%20Installer.exe',
        'install' => 'install --quiet',
        'directory' => '/Program Files/Docker',
      },
    },
  },
  'profiles' => {},
}
