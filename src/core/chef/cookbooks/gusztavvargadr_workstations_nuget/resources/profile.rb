property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :create

action :create do
  return if profile_options.nil?

  profile_sources = profile_options['sources']
  unless profile_sources.nil?
    profile_sources.each do |profile_source_name, profile_source_options|
      gusztavvargadr_workstations_nuget_source profile_source_name do
        source_options profile_source_options
        action :create
      end
    end
  end
end
