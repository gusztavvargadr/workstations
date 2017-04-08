property :repository_name, String, name_property: true
property :base_address, String, required: true
property :base_directory, String, required: true
property :repository_username, String
property :repository_password, String
property :repository_options, Hash

default_action :checkout

action :checkout do
  checkout_address = "#{base_address}/#{repository_name}"

  repository_directory = repository_options.nil? ? nil : repository_options['directory']
  repository_directory = repository_name if repository_directory.nil?
  checkout_directory = "#{base_directory}/#{repository_directory}"

  directory checkout_directory do
    recursive true
    action :create
  end

  subversion checkout_directory do
    repository checkout_address
    svn_username repository_username
    svn_password repository_password
    action :checkout
  end
end
