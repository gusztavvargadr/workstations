property :profiles_options, Hash

default_action :create

action :create do
  return if new_resource.profiles_options.nil?

  gusztavvargadr_workstations_nuget_profiles_workspaces '' do
    profiles_workspaces_options new_resource.profiles_options['workspaces']
    action :create
  end
end
