options = node['gusztavvargadr_workstations_vagrant']
return if options.nil?

gusztavvargadr_workstations_vagrant_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
