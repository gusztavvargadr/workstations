configuration_file = '/Users/vagrant/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1'

describe file(configuration_file) do
  it { should exist }
end
