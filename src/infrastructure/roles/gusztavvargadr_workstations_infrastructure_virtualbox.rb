name 'gusztavvargadr_workstations_infrastructure_virtualbox'
description 'Infrastructure VirtualBox workstations'
run_list 'role[gusztavvargadr_workstations_infrastructure]'
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
        'virtualbox' => {},
      },
    },
    'profiles' => {},
  }
)
