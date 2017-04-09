include_recipe 'gusztavvargadr_workstations_common::tools'

chocolatey_packages = %w(chefdk)
chocolatey_packages.each do |chocolatey_package_name|
  chocolatey_package chocolatey_package_name do
    action :install
  end
end
