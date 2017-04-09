profiles = node['gusztavvargadr_workstations_os'].nil? ? nil : node['gusztavvargadr_workstations_os']['profiles']
return if profiles.nil?

profiles.each do |profile_name, profile_options|
  gusztavvargadr_workstations_os_profile profile_name do
    profile_options profile_options
    action :install
  end
end
