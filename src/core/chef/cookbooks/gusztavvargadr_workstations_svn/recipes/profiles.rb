options = node['gusztavvargadr_workstations_svn']
return if options.nil?

gusztavvargadr_workstations_svn_profiles '' do
  profiles_options options['profiles']
  action :create
end
