query_script = <<-EOH
  docker images
EOH
value = 'microsoft/nanoserver'

describe powershell(query_script) do
  its('stdout') { should include value }
end
