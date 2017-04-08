property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :create

action :create do
  return if profile_options.nil?

  profile_address = URI.parse(profile_options['address'])
  profile_username = profile_options['username']
  profile_password = profile_options['password']
  unless profile_username.nil? || profile_password.nil?
    profile_address.user = profile_username
    profile_address.password = profile_password
  end
  profile_directory = profile_options['directory']

  profile_repositories = profile_options['repositories']
  unless profile_repositories.nil?
    profile_repositories.each do |profile_repository_name, profile_repository_options|
      gusztavvargadr_workstations_git_repository profile_repository_name do
        base_address profile_address.to_s
        base_directory profile_directory
        repository_options profile_repository_options
        action :clone
      end
    end
  end
end
