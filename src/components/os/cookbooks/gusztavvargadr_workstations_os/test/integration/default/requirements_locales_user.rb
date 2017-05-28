query_script_code = '(Get-Culture).Name'
value = 'en-GB'

describe powershell(query_script_code) do
  its('stdout') { should include value }
end
