options = node['gusztavvargadr_workstations_os']
return if options.nil?

gusztavvargadr_workstations_os_tools '' do
  tools_options options['tools']
  action :install
end
