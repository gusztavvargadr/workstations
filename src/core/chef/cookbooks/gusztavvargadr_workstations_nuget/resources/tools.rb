property :tools_options, Hash

default_action :install

action :install do
  return if tools_options.nil?

  gusztavvargadr_workstations_os_tools '' do
    tools_options new_resource.tools_options
    action :install
  end

  cookbook_file "#{ENV['APPDATA']}/NuGet/NuGet.Config" do
    source 'NuGet.Config2'
    cookbook 'gusztavvargadr_workstations_nuget'
    action :create
  end
end
