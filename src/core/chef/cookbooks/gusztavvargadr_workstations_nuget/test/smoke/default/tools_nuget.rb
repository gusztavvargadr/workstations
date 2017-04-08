script = <<-EOH
  NuGet
EOH

describe powershell(script) do
  its('stdout') { should include 'NuGet Version:' }
end

describe file('/Users/vagrant/AppData/Roaming/NuGet/NuGet.config') do
  it { should exist }
end
