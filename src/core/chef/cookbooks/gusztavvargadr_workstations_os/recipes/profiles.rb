options = node['gusztavvargadr_workstations_os']
return if options.nil?

gusztavvargadr_workstations_os_profiles '' do
  profiles_options options['profiles']
  action :create
end
