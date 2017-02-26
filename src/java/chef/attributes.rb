def vagrant_config_vm_provision_chef_attributes()
  {
    'w16' => {
      'os' => {},
      'tools' => {
        'gusztavvargadr_windows' => {
          'chocolatey_packages' => {
            'jdk8' => {},
            'maven' => {},
            'eclipse' => {},
            'intellijidea-community' => {},
          },
        },
      },
      'settings' => {},
    },
  }
end
