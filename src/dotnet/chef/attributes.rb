def vagrant_config_vm_provision_chef_attributes()
  {
    'w16_vs15' => {
      'os' => {
        'gusztavvargadr_windows' => {
          'features' => [
            'TelnetClient',
          ],
        },
      },
      'tools' => {
        'gusztavvargadr_windows' => {
          'chocolatey_packages' => {
            'resharper' => {},
            'dottrace' => {},
            'dotmemory' => {},
            'dotcover' => {},
            'dotpeek' => {},
            'fiddler4' => {},
          },
          'packages' => {
            'Redgate SQL Toolbelt' => {
              'source' => 'https://download.red-gate.com/SQLToolbelt.exe',
              'options' => '/IAgreeToTheEULA /q',
            },
          },
        },
      },
      'settings' => {
        'gusztavvargadr_git' => {
          'profiles' => {
            'https://github.com/gusztavvargadr' => {
              'repositories' => {
                'katas' => {},
                'aspnet-playground' => {},
                'aspnet-configuration-octopus' => {},
                'aspnet-Configuration.Contrib' => {},
              },
            },
          },
        },
      },
    },
  }
end
