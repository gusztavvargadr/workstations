name 'gusztavvargadr_workstations_dotnet'
description '.NET workstations'
run_list 'role[gusztavvargadr_workstations_core]',
  'recipe[gusztavvargadr_workstations_nuget::default]'
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
  },
  'gusztavvargadr_workstations_nuget' => {
    'requirements' => {},
    'tools' => {
      'files' => {
        "#{ENV['GUSZTAVVARGADR_WORKSTATIONS_CORE_PATH']}/NuGet.Config" => "#{ENV['APPDATA']}/NuGet/NuGet.Config",
      },
    },
    'profiles' => {},
  }
)
