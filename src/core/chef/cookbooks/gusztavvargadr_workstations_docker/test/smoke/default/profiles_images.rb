query_script = <<-EOH
  docker images
EOH
name = 'microsoft/nanoserver'

describe powershell(query_script) do
  its('stdout') { should include name }
end
