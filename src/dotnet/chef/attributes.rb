def chef_attributes()
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
            'conemu' => {},
            'far' => {},
            'visualstudiocode' => {},
            'beyondcompare' => {},
            'googlechrome' => {},
            'git' => {},
            'nuget.commandline' => {},
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
            # 'https://github.com' => {
            #   'checkout_directory_path' => '/Users/vagrant/Repos',
            #   'repositories' => {
            #     'github/gitignore' => {},
            #   },
            # },
            'https://github.com/gusztavvargadr' => {
              'username' => ENV['GIT_GITHUB_USERNAME'],
              'password' => ENV['GIT_GITHUB_PASSWORD'],
              'checkout_directory_path' => '/Users/vagrant/Repos/gusztavvargadr',
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
