property :timezone_name, String, name_property: true

default_action :set

action :set do
  powershell_script "Set time zone to #{timezone_name}" do
    code <<-EOH
      Set-TimeZone -Id "#{timezone_name}"
    EOH
    action :run
  end
end
