name 'gusztavvargadr_workstations_core'
description 'Core workstations'
run_list 'recipe[gusztavvargadr_workstations_os::default]',
  'recipe[gusztavvargadr_workstations_git::default]'
default_attributes(
  'gusztavvargadr_workstations_git' => {
    'tools' => {
      'files' => {
        "#{ENV['GUSZTAVVARGADR_WORKSTATIONS_CORE_PATH']}/files/.gitconfig" => "#{ENV['USERPROFILE']}/.gitconfig",
      },
    },
  }
)
