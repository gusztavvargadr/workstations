property :userlocale_name, String, name_property: true

default_action :set

action :set do
  powershell_script "Set user locale to #{userlocale_name}" do
    code <<-EOH
      Set-Culture -CultureInfo "#{userlocale_name}"
    EOH
    action :run
  end
end
