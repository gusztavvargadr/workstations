gusztavvargadr_workstations_nuget_configuration '' do
  action :create
end

profiles = node['gusztavvargadr_workstations_nuget'].nil? ? nil : node['gusztavvargadr_workstations_nuget']['profiles']
return if profiles.nil?

profiles.each do |profile_name, profile_options|
  gusztavvargadr_workstations_nuget_profile profile_name do
    profile_options profile_options
    action :create
  end
end
