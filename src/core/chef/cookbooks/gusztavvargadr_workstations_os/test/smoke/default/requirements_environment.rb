query_script = <<-EOH
  [environment]::GetEnvironmentVariable("VARIABLE_NAME", "User")
EOH
value = 'VARIABLE_VALUE'

describe powershell(query_script) do
  its('stdout') { should include value }
end
