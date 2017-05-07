name 'gusztavvargadr_workstations_dotnet'
description '.NET workstations'
run_list 'role[gusztavvargadr_workstations_core]',
  'recipe[gusztavvargadr_workstations_nuget::default]'
default_attributes(
  'gusztavvargadr_workstations_nuget' => {
    'tools' => {
      'files' => {
        "#{ENV['GUSZTAVVARGADR_WORKSTATIONS_CORE_PATH']}/files/NuGet.Config" => "#{ENV['APPDATA']}/NuGet/NuGet.Config",
      },
    },
  }
)
