name 'gusztavvargadr_workstations_infrastructure_docker'
description 'Infrastructure Docker workstations'
run_list 'role[gusztavvargadr_workstations_infrastructure]',
  'recipe[gusztavvargadr_workstations_docker::default]'
