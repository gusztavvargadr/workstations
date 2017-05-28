query_script_code = '([System.TimeZone]::CurrentTimeZone).StandardName'
value = 'GMT Standard Time'

describe powershell(query_script_code) do
  its('stdout') { should include value }
end
