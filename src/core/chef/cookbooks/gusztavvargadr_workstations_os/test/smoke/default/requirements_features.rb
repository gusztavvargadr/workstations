executable_file = '/Windows/System32/telnet.exe'

describe file(executable_file) do
  it { should exist }
end
