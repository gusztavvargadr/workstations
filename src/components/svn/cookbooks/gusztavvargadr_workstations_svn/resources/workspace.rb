property :workspace_name, String, name_property: true
property :workspace_options, Hash

default_action :create

action :create do
  return if workspace_options.nil?

  repository_base_address = workspace_options['address']
  repository_username = workspace_options['username'].to_s.empty? ? ENV["SVN_#{workspace_name}_USERNAME"] : workspace_options['username']
  repository_password = workspace_options['password'].to_s.empty? ? ENV["SVN_#{workspace_name}_PASSWORD"] : workspace_options['password']
  repository_base_directory = workspace_options['directory']

  repositories = workspace_options['repositories']
  unless repositories.nil?
    repositories.each do |repository_name, repository_options|
      gusztavvargadr_workstations_svn_repository repository_name do
        repository_base_address repository_base_address.to_s
        repository_username repository_username
        repository_password repository_password
        repository_base_directory repository_base_directory
        repository_options repository_options
        action :checkout
      end
    end
  end
end
