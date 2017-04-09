version_query_script = <<-EOH
  NuGet
EOH
version_value = 'NuGet Version:'

describe powershell(version_query_script) do
  its('stdout') { should include version_value }
end

configuration_file = '/Users/vagrant/AppData/Roaming/NuGet/NuGet.config'

describe file(configuration_file) do
  it { should exist }
end
