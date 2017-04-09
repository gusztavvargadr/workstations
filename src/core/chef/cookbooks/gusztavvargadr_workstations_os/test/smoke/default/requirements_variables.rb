query_script = <<-EOH
  [environment]::GetEnvironmentVariable("KITCHEN_VARIABLE_NAME", "User")
EOH
value = 'KITCHEN_VARIABLE_VALUE'

describe powershell(query_script) do
  its('stdout') { should include value }
end
