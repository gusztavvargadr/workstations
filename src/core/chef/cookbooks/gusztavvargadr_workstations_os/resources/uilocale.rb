property :uilocale_name, String, name_property: true

default_action :set

action :set do
  powershell_script "Set UI locale to #{uilocale_name}" do
    code <<-EOH
      $languageList = New-WinUserLanguageList "#{uilocale_name}"
      Set-WinUserLanguageList $languageList -Force
      Set-WinUILanguageOverride
    EOH
    action :run
  end
end
