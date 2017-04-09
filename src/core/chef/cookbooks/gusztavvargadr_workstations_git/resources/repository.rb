property :repository_name, String, name_property: true
property :base_address, String, required: true
property :base_directory, String, required: true
property :repository_options, Hash

default_action :clone

action :clone do
  clone_address = "#{base_address}/#{repository_name}"

  repository_directory = repository_options.nil? ? nil : repository_options['directory']
  repository_directory = repository_name if repository_directory.nil?
  clone_directory = "#{base_directory}/#{repository_directory}"

  directory clone_directory do
    recursive true
    action :create
  end

  git clone_directory do
    repository clone_address
    checkout_branch 'master'
    enable_checkout false
    action :checkout
  end
end
