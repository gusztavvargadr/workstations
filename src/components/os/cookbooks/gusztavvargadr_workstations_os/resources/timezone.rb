property :timezone_name, String, name_property: true

default_action :update

action :update do
  return if new_resource.timezone_name.to_s.empty?

  powershell_script "Update time zone to #{new_resource.timezone_name}" do
    code <<-EOH
      Set-TimeZone -Id "#{new_resource.timezone_name}"
    EOH
    action :run
  end
end
