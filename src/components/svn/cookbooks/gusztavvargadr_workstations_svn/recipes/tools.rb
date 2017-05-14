options = node['gusztavvargadr_workstations_svn']
return if options.nil?

gusztavvargadr_workstations_svn_tools '' do
  tools_options options['tools']
  action :install
end
