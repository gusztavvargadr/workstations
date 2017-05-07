name 'gusztavvargadr_workstations_java_eclipse'
description 'Java Eclipse workstations'
run_list 'role[gusztavvargadr_workstations_java]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {
      'chocolatey' => {
        'eclipse' => {},
      },
    },
    'profiles' => {},
  },
  'gusztavvargadr_workstations_git' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  }
)
