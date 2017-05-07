name 'gusztavvargadr_workstations_infrastructure'
description 'Infrastructure workstations'
run_list 'role[gusztavvargadr_workstations_core]',
  'recipe[gusztavvargadr_workstations_vagrant::default]'
default_attributes(
  'gusztavvargadr_workstations_vagrant' => {
    'tools' => {
      'chocolatey' => {
        'chefdk' => {},
        'packer' => {},
        'terraform' => {},
      },
    },
    'profiles' => {
      'plugins' => {
        'vagrant-reload' => {},
        'vagrant-berkshelf' => {},
      },
    },
  }
)
