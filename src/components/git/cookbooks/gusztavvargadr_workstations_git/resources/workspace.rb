property :workspace_name, String, name_property: true
property :workspace_options, Hash

default_action :create

action :create do
  return if new_resource.workspace_options.nil?

  repository_base_address = URI.parse(new_resource.workspace_options['address'])
  repository_username = new_resource.workspace_options['username'].to_s.empty? ? ENV["GIT_#{new_resource.workspace_name}_USERNAME"] : new_resource.workspace_options['username']
  repository_password = new_resource.workspace_options['password'].to_s.empty? ? ENV["GIT_#{new_resource.workspace_name}_PASSWORD"] : new_resource.workspace_options['password']
  unless repository_username.to_s.empty? || repository_password.to_s.empty?
    repository_base_address.user = repository_username
    repository_base_address.password = repository_password
  end
  repository_base_directory = new_resource.workspace_options['directory']

  repositories = new_resource.workspace_options['repositories']
  unless repositories.nil?
    repositories.each do |repository_name, repository_options|
      gusztavvargadr_workstations_git_repository repository_name do
        repository_base_address repository_base_address.to_s
        repository_base_directory repository_base_directory
        repository_options repository_options
        action :clone
      end
    end
  end
end
