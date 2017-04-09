property :variable_name, String, name_property: true
property :variable_value, String

default_action :set

action :set do
  powershell_script "Set variable #{variable_name}" do
    code <<-EOH
      [Environment]::SetEnvironmentVariable("#{variable_name}", "#{variable_value}", "User")
    EOH
    action :run
  end
end
