options = node['gusztavvargadr_workstations_core']
return if options.nil?

gusztavvargadr_workstations_core_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
