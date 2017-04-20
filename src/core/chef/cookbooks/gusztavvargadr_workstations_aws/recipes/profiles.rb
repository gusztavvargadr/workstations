options = node['gusztavvargadr_workstations_aws']
return if options.nil?

gusztavvargadr_workstations_aws_profiles '' do
  profiles_options options['profiles']
  action :create
end
