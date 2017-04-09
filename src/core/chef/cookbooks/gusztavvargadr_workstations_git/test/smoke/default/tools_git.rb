version_query_script = <<-EOH
  git --version
EOH
version_value = 'git version'

describe powershell(version_query_script) do
  its('stdout') { should include version_value }
end

configuration_file = '/Users/vagrant/.gitconfig'

describe file(configuration_file) do
  it { should exist }
end
