script = <<-EOH
  ssh
EOH

describe powershell(script) do
  its('stderr') { should include 'usage: ssh' }
end
