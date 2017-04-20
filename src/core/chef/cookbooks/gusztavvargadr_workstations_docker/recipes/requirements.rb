options = node['gusztavvargadr_workstations_docker']
return if options.nil?

gusztavvargadr_workstations_docker_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
