options = node['gusztavvargadr_workstations_nuget']
return if options.nil?

gusztavvargadr_workstations_nuget_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
