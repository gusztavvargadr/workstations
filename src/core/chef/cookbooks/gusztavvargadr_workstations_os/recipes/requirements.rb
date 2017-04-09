requirements = node['gusztavvargadr_workstations_os'].nil? ? nil : node['gusztavvargadr_workstations_os']['requirements']
return if requirements.nil?

gusztavvargadr_workstations_os_requirements '' do
  requirements_systemlocale requirements['systemlocale']
  requirements_uilocale requirements['uilocale']
  requirements_userlocale requirements['userlocale']
  requirements_timezone requirements['timezone']
  action :install
end
