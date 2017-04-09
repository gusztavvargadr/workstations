include_recipe 'gusztavvargadr_workstations_common::tools'

windows_package 'Redgate SQL Toolbelt' do
  source 'https://download.red-gate.com/SQLToolbelt.exe'
  installer_type :custom
  options '/IAgreeToTheEULA /q'
  action :install
end
