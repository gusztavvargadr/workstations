property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  gusztavvargadr_workstations_core_profiles '' do
    profiles_options new_resource.profiles_options
    action :create
  end

  gusztavvargadr_workstations_aws_profiles_workspaces '' do
    profiles_workspaces_options profiles_options['workspaces']
    action :create
  end
end
