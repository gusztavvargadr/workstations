requirements = node['gusztavvargadr_workstations_os'].nil? ? nil : node['gusztavvargadr_workstations_os']['requirements']
return if requirements.nil?

gusztavvargadr_workstations_os_requirements '' do
  requirements_options requirements
  action :install
end
