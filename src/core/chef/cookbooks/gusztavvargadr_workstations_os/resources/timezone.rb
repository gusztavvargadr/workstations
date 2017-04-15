property :timezone_name, String, name_property: true

default_action :update

action :update do
  return if timezone_name.to_s.empty?

  powershell_script "Update time zone to #{timezone_name}" do
    code <<-EOH
      Set-TimeZone -Id "#{timezone_name}"
    EOH
    action :run
  end
end
