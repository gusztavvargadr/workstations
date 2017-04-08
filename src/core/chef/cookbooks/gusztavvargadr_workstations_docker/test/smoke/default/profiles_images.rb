script = <<-EOH
  docker images
EOH

describe powershell(script) do
  its('stdout') { should include 'microsoft/nanoserver' }
end
