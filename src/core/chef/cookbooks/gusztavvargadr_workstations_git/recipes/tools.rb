options = node['gusztavvargadr_workstations_git']
return if options.nil?

gusztavvargadr_workstations_git_tools '' do
  tools_options options['tools']
  action :install
end
