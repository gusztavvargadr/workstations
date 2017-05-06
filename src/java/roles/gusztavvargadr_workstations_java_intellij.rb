name 'gusztavvargadr_workstations_java_intellij'
description 'Java IntelliJ IDEA workstations'
run_list 'role[gusztavvargadr_workstations_java]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {
      'chocolatey' => {
        'intellijidea-community' => {},
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
