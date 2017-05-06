name 'gusztavvargadr_workstations_infrastructure_docker'
description 'Infrastructure Docker workstations'
run_list 'role[gusztavvargadr_workstations_infrastructure]',
  'recipe[gusztavvargadr_workstations_docker::default]'
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
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_docker' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  }
)
