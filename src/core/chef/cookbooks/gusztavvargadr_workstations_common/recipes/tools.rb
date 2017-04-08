include_recipe 'gusztavvargadr_workstations_os::tools'
include_recipe 'gusztavvargadr_workstations_docker::tools'
include_recipe 'gusztavvargadr_workstations_git::tools'
include_recipe 'gusztavvargadr_workstations_svn::tools'
include_recipe 'gusztavvargadr_workstations_nuget::tools'

chocolatey_packages = %w(conemu far visualstudiocode beyondcompare googlechrome)
chocolatey_packages.each do |chocolatey_package_name|
  chocolatey_package chocolatey_package_name do
    action :install
  end
end
