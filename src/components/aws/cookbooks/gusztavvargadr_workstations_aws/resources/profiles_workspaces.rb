property :profiles_workspaces_options, Hash

default_action :create

action :create do
  return if new_resource.profiles_workspaces_options.nil?

  directory "#{ENV['USERPROFILE']}/.aws" do
    recursive true
    action :create
  end

  config_profiles = {}
  new_resource.profiles_workspaces_options.each do |workspace_name, workspace_options|
    config_profiles[workspace_name] = {
      'region' => workspace_options['region'],
    }
  end

  template "#{ENV['USERPROFILE']}/.aws/config" do
    source 'config.erb'
    cookbook 'gusztavvargadr_workstations_aws'
    variables profiles: config_profiles
    action :create
  end

  credentials_profiles = {}
  new_resource.profiles_workspaces_options.each do |workspace_name, workspace_options|
    credentials_profiles[workspace_name] = {
      'access_key_id' => workspace_options['access_key_id'].to_s.empty? ? ENV["AWS_#{workspace_name}_ACCESS_KEY_ID"] : workspace_options['access_key_id'],
      'secret_access_key' => workspace_options['secret_access_key'].to_s.empty? ? ENV["AWS_#{workspace_name}_SECRET_ACCESS_KEY"] : workspace_options['secret_access_key'],
    }
  end
  template "#{ENV['USERPROFILE']}/.aws/credentials" do
    source 'credentials.erb'
    cookbook 'gusztavvargadr_workstations_aws'
    variables profiles: credentials_profiles
    action :create
  end
end
