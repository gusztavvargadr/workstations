property :profiles_plugins_options, Hash

default_action :install

action :install do
  return if new_resource.profiles_plugins_options.nil?

  new_resource.profiles_plugins_options.each do |plugin_name, plugin_options|
    gusztavvargadr_workstations_vagrant_plugin plugin_name do
      plugin_options plugin_options
      action :install
    end
  end
end
