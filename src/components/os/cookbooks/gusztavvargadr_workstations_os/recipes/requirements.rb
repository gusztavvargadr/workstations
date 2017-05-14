options = node['gusztavvargadr_workstations_os']
return if options.nil?

gusztavvargadr_workstations_os_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
