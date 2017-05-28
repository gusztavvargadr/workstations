query_script = 'vagrant plugin list'
value = 'vagrant-reload'

describe powershell(query_script) do
  its('stdout') { should include value }
end
