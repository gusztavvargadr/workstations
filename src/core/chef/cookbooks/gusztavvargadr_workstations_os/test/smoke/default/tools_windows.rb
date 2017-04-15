executable_file = '/Program Files/dotnet/dotnet.exe'

describe file(executable_file) do
  it { should exist }
end
