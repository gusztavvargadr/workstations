options = node['gusztavvargadr_workstations_git']
return if options.nil?

gusztavvargadr_workstations_git_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
