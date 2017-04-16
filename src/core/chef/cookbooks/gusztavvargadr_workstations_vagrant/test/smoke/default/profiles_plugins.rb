query_script = <<-EOH
  vagrant plugin list
EOH
value = 'vagrant-reload'

describe powershell(query_script) do
  its('stdout') { should include value }
end
