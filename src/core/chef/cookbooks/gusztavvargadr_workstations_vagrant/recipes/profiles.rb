options = node['gusztavvargadr_workstations_vagrant']
return if options.nil?

gusztavvargadr_workstations_vagrant_profiles '' do
  profiles_options options['profiles']
  action :create
end
