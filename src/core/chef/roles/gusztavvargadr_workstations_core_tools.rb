name 'gusztavvargadr_workstations_core_tools'
description 'Core workstation tools'
run_list 'recipe[gusztavvargadr_workstations_os::tools]',
  'recipe[gusztavvargadr_workstations_docker::tools]',
  'recipe[gusztavvargadr_workstations_git::tools]'
