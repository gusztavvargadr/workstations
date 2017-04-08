default_action :create

action :create do
  cookbook_file "#{ENV['APPDATA']}/NuGet/NuGet.config" do
    source 'NuGet.config'
    cookbook 'gusztavvargadr_workstations_nuget'
    action :create
  end
end
