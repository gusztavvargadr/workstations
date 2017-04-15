name 'gusztavvargadr_workstations_dotnet_tools'
description '.NET workstation tools'
run_list 'role[gusztavvargadr_workstations_core_tools]',
  'recipe[gusztavvargadr_workstations_nuget::tools]'
