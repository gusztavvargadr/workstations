name 'gusztavvargadr_workstations_infrastructure'
description 'Infrastructure workstations'
run_list 'role[gusztavvargadr_workstations_core]',
  'recipe[gusztavvargadr_workstations_vagrant::default]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_git' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_vagrant' => {
    'requirements' => {},
    'tools' => {
      'chocolatey' => {
        'chefdk' => {},
        'packer' => {},
      },
    },
    'profiles' => {
      'plugins' => {
        'nugrant' => {},
        'vagrant-reload' => {},
        'vagrant-berkshelf' => {},
      },
    },
  }
)
