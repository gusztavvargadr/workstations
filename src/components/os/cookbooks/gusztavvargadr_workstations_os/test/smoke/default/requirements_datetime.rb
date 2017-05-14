query_script = <<-EOH
  ([System.TimeZone]::CurrentTimeZone).StandardName
EOH
value = 'GMT Standard Time'

describe powershell(query_script) do
  its('stdout') { should include value }
end
