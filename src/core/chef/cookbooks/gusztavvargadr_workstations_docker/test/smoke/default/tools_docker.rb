version_query_script = <<-EOH
  docker version
EOH
version_client_value = 'Client:'
version_server_value = 'Server:'

describe powershell(version_query_script) do
  its('stdout') { should include version_client_value }
  its('stdout') { should include version_server_value }
end
