def vagrant_config_vm_provision_chef_attributes()
  {
    'w16' => {
      'os' => {},
      'tools' => {
        'gusztavvargadr_windows' => {
          'chocolatey_packages' => {
            'chefdk' => {},
          },
        },
      },
      'settings' => {
        'gusztavvargadr_git' => {
          'profiles' => {
            'https://github.com/gusztavvargadr' => {
              'repositories' => {
                'chef' => {},
              },
            },
          },
        },
      },
    },
  }
end
