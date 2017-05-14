options = node['gusztavvargadr_workstations_ssms']
return if options.nil?

gusztavvargadr_workstations_ssms_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
