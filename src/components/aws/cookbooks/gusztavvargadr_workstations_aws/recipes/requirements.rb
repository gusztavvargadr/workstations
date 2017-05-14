options = node['gusztavvargadr_workstations_aws']
return if options.nil?

gusztavvargadr_workstations_aws_requirements '' do
  requirements_options options['requirements']
  action :ensure
end
