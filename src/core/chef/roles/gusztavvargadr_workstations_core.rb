name 'gusztavvargadr_workstations_core'
description 'Core workstations'
run_list 'recipe[gusztavvargadr_workstations_os::default]',
  'recipe[gusztavvargadr_workstations_git::default]',
  'recipe[gusztavvargadr_workstations_vagrant::default]',
  'recipe[gusztavvargadr_workstations_docker::default]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_git' => {
    'requirements' => {},
    'tools' => {
      'files' => {
        "#{ENV['GUSZTAVVARGADR_WORKSTATIONS_FILES']}/.gitconfig" => "#{ENV['USERPROFILE']}/.gitconfig",
      },
    },
    'profiles' => {},
  },
  'gusztavvargadr_workstations_vagrant' => {
    'requirements' => {},
    'tools' => {
      'chocolatey' => {
        'chefdk' => {},
      },
    },
    'profiles' => {
      'plugins' => {
        'vagrant-berkshelf' => {},
        'vagrant-reload' => {},
      },
    },
  },
  'gusztavvargadr_workstations_docker' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  }
)
