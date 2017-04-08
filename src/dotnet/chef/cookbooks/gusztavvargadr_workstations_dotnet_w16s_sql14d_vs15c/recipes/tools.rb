include_recipe 'gusztavvargadr_workstations_common::tools'

chocolatey_packages = %w{resharper dottrace dotmemory dotcover dotpeek postman fiddler4}
chocolatey_packages.each do |chocolatey_package_name|
  chocolatey_package chocolatey_package_name do
    action :install
  end
end

windows_package 'Redgate SQL Toolbelt' do
  source 'https://download.red-gate.com/SQLToolbelt.exe'
  installer_type :custom
  options '/IAgreeToTheEULA /q'
  action :install
end
