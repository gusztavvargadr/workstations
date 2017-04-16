name 'gusztavvargadr_workstations_infrastructure_profiles'
description 'Infrastructure workstation profiles'
run_list 'role[gusztavvargadr_workstations_core_profiles]',
  'recipe[gusztavvargadr_workstations_vagrant::profiles]'
default_attributes(
  'gusztavvargadr_workstations_vagrant' => {
    'profiles' => {
      'plugins' => {
        'vagrant-berkshelf' => {},
        'vagrant-reload' => {},
      },
    },
  }
)
