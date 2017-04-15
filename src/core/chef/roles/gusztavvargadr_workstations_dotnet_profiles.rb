name 'gusztavvargadr_workstations_dotnet_profiles'
description '.NET workstation profiles'
run_list 'role[gusztavvargadr_workstations_core_profiles]',
  'recipe[gusztavvargadr_workstations_nuget::profiles]'
