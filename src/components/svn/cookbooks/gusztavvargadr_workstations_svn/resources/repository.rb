property :repository_name, String, name_property: true
property :repository_base_address, String, required: true
property :repository_username, String
property :repository_password, String
property :repository_base_directory, String, required: true
property :repository_options, Hash

default_action :checkout

action :checkout do
  svn_directory = new_resource.repository_options.nil? ? nil : new_resource.repository_options['directory']
  svn_directory = new_resource.repository_name if svn_directory.nil?
  svn_directory = "#{new_resource.repository_base_directory}/#{svn_directory}"

  directory svn_directory do
    recursive true
    action :create
  end

  svn_repository = "#{new_resource.repository_base_address}/#{new_resource.repository_name}"

  subversion svn_directory do
    repository svn_repository
    svn_username new_resource.repository_username
    svn_password new_resource.repository_password
    action :checkout
  end
end
