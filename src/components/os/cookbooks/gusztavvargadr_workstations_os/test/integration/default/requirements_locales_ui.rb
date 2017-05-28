query_script_code = '(Get-WinUserLanguageList)[0].LanguageTag'
value = 'en-GB'

describe powershell(query_script_code) do
  its('stdout') { should include value }
end
