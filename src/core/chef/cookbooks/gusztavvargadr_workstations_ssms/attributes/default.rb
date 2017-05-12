default['gusztavvargadr_workstations_ssms'] = {
  'requirements' => {},
  'tools' => {
    'custom' => {
      'SQL Server Management Studio 16' => {
        'source' => 'https://download.microsoft.com/download/9/3/3/933EA6DD-58C5-4B78-8BEC-2DF389C72BE0/SSMS-Setup-ENU.exe',
        'install' => '/install /quiet /norestart',
        'directory' => '/Program Files (x86)/Microsoft SQL Server/130/Tools/Binn/ManagementStudio'
      },
    },
  },
  'profiles' => {},
}
