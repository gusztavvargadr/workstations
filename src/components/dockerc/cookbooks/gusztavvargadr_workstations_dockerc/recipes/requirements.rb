options = node['gusztavvargadr_workstations_dockerc']
return if options.nil?

gusztavvargadr_workstations_dockerc_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
