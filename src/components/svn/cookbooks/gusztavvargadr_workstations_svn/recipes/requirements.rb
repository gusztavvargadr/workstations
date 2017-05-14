options = node['gusztavvargadr_workstations_svn']
return if options.nil?

gusztavvargadr_workstations_svn_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
