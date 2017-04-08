include_recipe 'gusztavvargadr_workstations_os::profiles'
include_recipe 'gusztavvargadr_workstations_docker::profiles'
include_recipe 'gusztavvargadr_workstations_git::profiles'
include_recipe 'gusztavvargadr_workstations_svn::profiles'
include_recipe 'gusztavvargadr_workstations_nuget::profiles'

cookbook_file "#{ENV['APPDATA']}/ConEmu.xml" do
  source 'ConEmu.xml'
  cookbook 'gusztavvargadr_workstations_common'
  action :create
end
