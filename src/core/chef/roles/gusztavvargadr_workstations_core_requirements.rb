name 'gusztavvargadr_workstations_core_requirements'
description 'Core workstation requirements'
run_list 'recipe[gusztavvargadr_workstations_os::requirements]',
  'recipe[gusztavvargadr_workstations_docker::requirements]',
  'recipe[gusztavvargadr_workstations_git::requirements]'
