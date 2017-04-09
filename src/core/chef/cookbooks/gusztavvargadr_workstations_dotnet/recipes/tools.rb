include_recipe 'gusztavvargadr_workstations_common::tools'

chocolatey_package 'resharper' do
  version '2016.3.2.0'
  action :install
end

chocolatey_packages = %w(resharper-clt dottrace dotmemory dotcover dotpeek postman fiddler4)
chocolatey_packages.each do |chocolatey_package_name|
  chocolatey_package chocolatey_package_name do
    action :install
  end
end
