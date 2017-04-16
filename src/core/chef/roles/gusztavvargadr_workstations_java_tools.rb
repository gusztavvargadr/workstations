name 'gusztavvargadr_workstations_java_tools'
description 'Java workstation tools'
run_list 'role[gusztavvargadr_workstations_core_tools]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'tools' => {
      'chocolatey' => {
        'jdk8' => {},
        'maven' => {},
        'intellijidea-community' => {},
      },
    },
  }
)
