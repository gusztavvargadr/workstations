query_script = <<-EOH
  vagrant box list
EOH
value = 'ubuntu/trusty32'

describe powershell(query_script) do
  its('stdout') { should include value }
end
