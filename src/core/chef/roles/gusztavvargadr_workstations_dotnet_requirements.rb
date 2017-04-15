name 'gusztavvargadr_workstations_dotnet_requirements'
description '.NET workstation requirements'
run_list 'role[gusztavvargadr_workstations_core_requirements]',
  'recipe[gusztavvargadr_workstations_nuget::requirements]'
