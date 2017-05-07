name 'gusztavvargadr_workstations_infrastructure_virtualbox'
description 'Infrastructure VirtualBox workstations'
run_list 'role[gusztavvargadr_workstations_infrastructure]'
default_attributes(
  'gusztavvargadr_workstations_vagrant' => {
    'tools' => {
      'chocolatey' => {
        'virtualbox' => {},
      },
    },
  }
)
