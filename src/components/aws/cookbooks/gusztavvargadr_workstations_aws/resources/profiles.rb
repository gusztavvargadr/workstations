property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  gusztavvargadr_workstations_aws_profiles_workspaces '' do
    profiles_workspaces_options profiles_options['workspaces']
    action :create
  end
end
