name 'gusztavvargadr_workstations_java_eclipse'
description 'Java Eclipse workstations'
run_list 'role[gusztavvargadr_workstations_java]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'tools' => {
      'chocolatey' => {
        'eclipse' => {},
      },
    },
  }
)
