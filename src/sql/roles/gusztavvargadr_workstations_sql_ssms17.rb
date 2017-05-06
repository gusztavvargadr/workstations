name 'gusztavvargadr_workstations_sql_ssms17'
description 'SQL Server Manamgement Studio 17 workstations'
run_list 'role[gusztavvargadr_workstations_sql]'
default_attributes(
  'gusztavvargadr_workstations_os' => {
    'requirements' => {},
    'tools' => {
      'windows' => {
        'SQL Server Management Studio 17' => {
          'source' => 'https://download.microsoft.com/download/C/8/A/C8AE3D51-5AAD-4DCF-809C-667D691629E4/SSMS-Setup-ENU.exe',
          'install' => '/install /quiet /norestart',
          'directory' => '/Program Files (x86)/Microsoft SQL Server/140/Tools/Binn/ManagementStudio',
        },
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
