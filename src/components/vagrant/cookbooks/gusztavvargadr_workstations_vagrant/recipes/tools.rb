options = node['gusztavvargadr_workstations_vagrant']
return if options.nil?

gusztavvargadr_workstations_vagrant_tools '' do
  tools_options options['tools']
  action :install
end
