options = node['gusztavvargadr_workstations_dockerc']
return if options.nil?

gusztavvargadr_workstations_dockerc_profiles '' do
  profiles_options options['profiles']
  action :create
end
