script = <<-EOH
  docker version
EOH

describe powershell(script) do
  its('stdout') { should include 'Client:' }
  its('stdout') { should include 'Server:' }
end
