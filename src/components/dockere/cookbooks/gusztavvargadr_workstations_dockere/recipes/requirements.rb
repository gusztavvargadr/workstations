options = node['gusztavvargadr_workstations_dockere']
return if options.nil?

gusztavvargadr_workstations_dockere_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
