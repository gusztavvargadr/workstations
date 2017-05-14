options = node['gusztavvargadr_workstations_git']
return if options.nil?

gusztavvargadr_workstations_git_profiles '' do
  profiles_options options['profiles']
  action :create
end
