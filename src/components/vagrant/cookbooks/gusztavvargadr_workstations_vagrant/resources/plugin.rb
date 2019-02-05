property :plugin_name, String, name_property: true
property :plugin_options, Hash

default_action :install

action :install do
  powershell_script "Install plugin '#{new_resource.plugin_name}'" do
    code <<-EOH
      vagrant plugin install #{new_resource.plugin_name}
    EOH
    action :run
  end
end
