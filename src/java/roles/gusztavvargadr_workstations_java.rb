name 'gusztavvargadr_workstations_java'
description 'Java workstations'
run_list 'role[gusztavvargadr_workstations_core]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'tools' => {
      'chocolatey' => {
        'jdk8' => {},
        'maven' => {},
      },
    },
  }
)
