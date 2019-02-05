property :profiles_workspaces_options, Hash

default_action :create

action :create do
  return if new_resource.profiles_workspaces_options.nil?

  new_resource.profiles_workspaces_options.each do |workspace_name, workspace_options|
    gusztavvargadr_workstations_git_workspace workspace_name do
      workspace_options workspace_options
      action :create
    end
  end
end
