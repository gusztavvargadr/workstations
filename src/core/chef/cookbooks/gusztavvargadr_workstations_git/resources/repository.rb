property :repository_name, String, name_property: true
property :repository_base_address, String, required: true
property :repository_base_directory, String, required: true
property :repository_options, Hash

default_action :clone

action :clone do
  git_directory = repository_options.nil? ? nil : repository_options['directory']
  git_directory = repository_name if git_directory.nil?
  git_directory = "#{repository_base_directory}/#{git_directory}"

  directory git_directory do
    recursive true
    action :create
  end

  git_repository = "#{repository_base_address}/#{repository_name}"
  git_checkout_branch = 'master'
  git_enable_checkout = false

  git git_directory do
    repository git_repository
    checkout_branch git_checkout_branch
    enable_checkout git_enable_checkout
    action :checkout
  end
end
