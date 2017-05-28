query_script = 'vagrant box list'
value = 'ubuntu/trusty32'

describe powershell(query_script) do
  its('stdout') { should include value }
end
