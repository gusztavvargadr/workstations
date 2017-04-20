options = node['gusztavvargadr_workstations_aws']
return if options.nil?

gusztavvargadr_workstations_aws_tools '' do
  tools_options options['tools']
  action :install
end
