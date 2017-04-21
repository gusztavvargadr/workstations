options = node['gusztavvargadr_workstations_core']
return if options.nil?

gusztavvargadr_workstations_core_tools '' do
  tools_options options['tools']
  action :install
end
