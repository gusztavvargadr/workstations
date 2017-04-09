query_script = <<-EOH
  (Get-WinUserLanguageList)[0].LanguageTag
EOH
value = 'en-GB'

describe powershell(query_script) do
  its('stdout') { should include value }
end
