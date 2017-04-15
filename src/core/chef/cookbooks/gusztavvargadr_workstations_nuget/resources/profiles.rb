property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  gusztavvargadr_workstations_os_profiles '' do
    profiles_options new_resource.profiles_options
    action :create
  end

  gusztavvargadr_workstations_nuget_profiles_workspaces '' do
    profiles_workspaces_options profiles_options['workspaces']
    action :create
  end
end
