property :systemlocale_name, String, name_property: true

default_action :set

action :set do
  powershell_script "Set system locale to #{systemlocale_name}" do
    code <<-EOH
      Set-WinSystemLocale -SystemLocale "#{systemlocale_name}"
    EOH
    action :run
  end
end
