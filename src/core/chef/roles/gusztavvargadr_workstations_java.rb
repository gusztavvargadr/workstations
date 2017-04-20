name 'gusztavvargadr_workstations_java'
description 'Java workstations'
run_list 'role[gusztavvargadr_workstations_core]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {
      'chocolatey' => {
        'jdk8' => {},
        'maven' => {},
        'intellijidea-community' => {},
      },
    },
    'profiles' => {},
  },
  'gusztavvargadr_workstations_git' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_vagrant' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  },
  'gusztavvargadr_workstations_docker' => {
    'requirements' => {},
    'tools' => {},
    'profiles' => {},
  }
)
