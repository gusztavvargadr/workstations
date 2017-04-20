default['gusztavvargadr_workstations_git'] = {
  'requirements' => {},
  'tools' => {
    'chocolatey' => {
      'git' => {
        'version' => '2.11.1',
        'install' => '-params \'"/GitAndUnixToolsOnPath /NoShellIntegration"\'',
      },
    },
  },
  'profiles' => {},
}
