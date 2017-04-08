script = <<-EOH
  git --version
EOH

describe powershell(script) do
  its('stdout') { should include 'git version' }
end

describe file('/Users/vagrant/.gitconfig') do
  it { should exist }
end
