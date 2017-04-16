property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  gusztavvargadr_workstations_os_profiles '' do
    profiles_options new_resource.profiles_options
    action :create
  end

  directory ENV['USERPROFILE'] do
    recursive true
    action :create
  end

  cookbook_file "#{ENV['USERPROFILE']}/.gitconfig" do
    source '.gitconfig'
    cookbook 'gusztavvargadr_workstations_git'
    action :create
  end

  gusztavvargadr_workstations_git_profiles_workspaces '' do
    profiles_workspaces_options profiles_options['workspaces']
    action :create
  end
end
