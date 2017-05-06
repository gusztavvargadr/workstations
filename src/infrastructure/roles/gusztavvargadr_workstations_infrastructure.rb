name 'gusztavvargadr_workstations_infrastructure'
description 'Infrastructure workstations'
run_list 'role[gusztavvargadr_workstations_core]',
  'recipe[gusztavvargadr_workstations_aws::default]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {
      'chocolatey' => {
        'packer' => {},
        'terraform' => {},
      },
    },
    'profiles' => {},
  },
  'gusztavvargadr_workstations_git' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_vagrant' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {
      'plugins' => {
        'vagrant-aws' => {},
      },
    },
  },
  'gusztavvargadr_workstations_docker' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_aws' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  }
)
