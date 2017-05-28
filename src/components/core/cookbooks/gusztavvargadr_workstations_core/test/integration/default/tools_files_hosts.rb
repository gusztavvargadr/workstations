file_path = '/Users/vagrant/AppData/Local/Temp/hosts'

describe file(file_path) do
  it { should exist }
end
