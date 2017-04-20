options = node['gusztavvargadr_workstations_nuget']
return if options.nil?

gusztavvargadr_workstations_nuget_tools '' do
  tools_options options['tools']
  action :install
end
