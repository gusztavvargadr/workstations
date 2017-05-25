options = node['gusztavvargadr_workstations_dockere']
return if options.nil?

gusztavvargadr_workstations_dockere_tools '' do
  tools_options options['tools']
  action :install
end
