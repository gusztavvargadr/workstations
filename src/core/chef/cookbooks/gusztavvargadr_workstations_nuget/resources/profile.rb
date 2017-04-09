property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :install

action :install do
  return if profile_options.nil?

  profile_address = profile_options['address']
  profile_username = profile_options['username'].to_s.empty? ? ENV["NUGET_#{profile_name}_USERNAME"] : profile_options['username']
  profile_password = profile_options['password'].to_s.empty? ? ENV["NUGET_#{profile_name}_PASSWORD"] : profile_options['password']

  profile_sources = profile_options['sources']
  unless profile_sources.nil?
    profile_sources.each do |profile_source_name, profile_source_options|
      gusztavvargadr_workstations_nuget_source profile_source_name do
        base_address profile_address
        source_username profile_username
        source_password profile_password 
        source_options profile_source_options
        action :create
      end
    end
  end
end
