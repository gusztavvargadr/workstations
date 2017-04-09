query_script = <<-EOH
  (Get-TimeZone).Id
EOH
value = 'GMT Standard Time'

describe powershell(query_script) do
  its('stdout') { should include value }
end
