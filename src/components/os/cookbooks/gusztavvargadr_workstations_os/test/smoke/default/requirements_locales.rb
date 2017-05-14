system_query_script = <<-EOH
  (Get-WinSystemLocale).Name
EOH
system_value = 'en-GB'

describe powershell(system_query_script) do
  its('stdout') { should include system_value }
end

ui_query_script = <<-EOH
  (Get-WinUserLanguageList)[0].LanguageTag
EOH
ui_value = 'en-GB'

describe powershell(ui_query_script) do
  its('stdout') { should include ui_value }
end

user_query_script = <<-EOH
  (Get-Culture).Name
EOH
user_value = 'en-GB'

describe powershell(user_query_script) do
  its('stdout') { should include user_value }
end
