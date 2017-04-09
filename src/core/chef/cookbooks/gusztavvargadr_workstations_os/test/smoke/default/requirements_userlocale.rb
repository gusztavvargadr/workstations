query_script = <<-EOH
  (Get-Culture).Name
EOH
value = 'en-GB'

describe powershell(query_script) do
  its('stdout') { should include value }
end
