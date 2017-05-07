name 'gusztavvargadr_workstations_infrastructure_aws'
description 'Infrastructure AWS workstations'
run_list 'role[gusztavvargadr_workstations_infrastructure]',
  'recipe[gusztavvargadr_workstations_aws::default]'
default_attributes(
  'gusztavvargadr_workstations_vagrant' => {
    'profiles' => {
      'plugins' => {
        'vagrant-aws' => {},
      },
    },
  }
)
