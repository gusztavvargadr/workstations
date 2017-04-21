file = '/Users/vagrant/hosts'

describe file(file) do
  it { should exist }
end
