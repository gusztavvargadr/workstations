options = node['gusztavvargadr_workstations_core']
return if options.nil?

gusztavvargadr_workstations_core_profiles '' do
  profiles_options options['profiles']
  action :create
end
