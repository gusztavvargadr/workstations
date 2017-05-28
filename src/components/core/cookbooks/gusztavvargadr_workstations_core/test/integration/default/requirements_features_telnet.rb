executable_path = "#{ENV['windir']}/System32/telnet.exe"

describe file(executable_path) do
  it { should exist }
end
