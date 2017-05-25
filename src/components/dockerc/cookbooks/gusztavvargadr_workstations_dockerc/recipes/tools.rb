options = node['gusztavvargadr_workstations_dockerc']
return if options.nil?

gusztavvargadr_workstations_dockerc_tools '' do
  tools_options options['tools']
  action :install
end
