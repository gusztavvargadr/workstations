options = node['gusztavvargadr_workstations_docker']
return if options.nil?

gusztavvargadr_workstations_docker_tools '' do
  tools_options options['tools']
  action :install
end
