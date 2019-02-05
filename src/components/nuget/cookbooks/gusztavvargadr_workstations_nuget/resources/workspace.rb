property :workspace_name, String, name_property: true
property :workspace_options, Hash

default_action :create

action :create do
  return if new_resource.workspace_options.nil?

  source_base_address = new_resource.workspace_options['address']
  source_username = new_resource.workspace_options['username'].to_s.empty? ? ENV["NUGET_#{new_resource.workspace_name}_USERNAME"] : new_resource.workspace_options['username']
  source_password = new_resource.workspace_options['password'].to_s.empty? ? ENV["NUGET_#{new_resource.workspace_name}_PASSWORD"] : new_resource.workspace_options['password']

  sources = new_resource.workspace_options['sources']
  unless sources.nil?
    sources.each do |source_name, source_options|
      gusztavvargadr_workstations_nuget_source source_name do
        source_base_address source_base_address
        source_username source_username
        source_password source_password
        source_options source_options
        action :create
      end
    end
  end
end
