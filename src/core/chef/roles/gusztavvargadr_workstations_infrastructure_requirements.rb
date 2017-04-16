name 'gusztavvargadr_workstations_infrastructure_requirements'
description 'Infrastructure workstation requirements'
run_list 'role[gusztavvargadr_workstations_core_requirements]',
  'recipe[gusztavvargadr_workstations_vagrant::requirements]',
  'recipe[gusztavvargadr_workstations_aws::requirements]'
