profiles = node['gusztavvargadr_workstations_svn'].nil? ? nil : node['gusztavvargadr_workstations_svn']['profiles']
return if profiles.nil?

profiles.each do |profile_name, profile_options|
  gusztavvargadr_workstations_svn_profile profile_name do
    profile_options profile_options
    action :create
  end
end
