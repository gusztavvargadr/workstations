options = node['gusztavvargadr_workstations_ssms']
return if options.nil?

gusztavvargadr_workstations_ssms_tools '' do
  tools_options options['tools']
  action :install
end
