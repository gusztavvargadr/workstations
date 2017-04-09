version_query_script = <<-EOH
  ssh
EOH
version_value = 'usage: ssh'

describe powershell(version_query_script) do
  its('stderr') { should include version_value }
end
