property :locale_name, String, name_property: true

default_action :update

action :update do
  return if new_resource.locale_name.to_s.empty?

  powershell_script "Update UI locale to #{new_resource.locale_name}" do
    code <<-EOH
      $languageList = New-WinUserLanguageList "#{new_resource.locale_name}"
      Set-WinUserLanguageList $languageList -Force
      Set-WinUILanguageOverride
    EOH
    action :run
  end
end
