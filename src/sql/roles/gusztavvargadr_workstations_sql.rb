name 'gusztavvargadr_workstations_sql'
description 'SQL workstations'
run_list 'role[gusztavvargadr_workstations_core]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_git' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  }
)
