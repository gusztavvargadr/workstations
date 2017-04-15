name 'gusztavvargadr_workstations_core_profiles'
description 'Core workstation profiles'
run_list 'recipe[gusztavvargadr_workstations_os::profiles]',
  'recipe[gusztavvargadr_workstations_docker::profiles]',
  'recipe[gusztavvargadr_workstations_git::profiles]'
