executable_file = '/ProgramData/chocolatey/bin/NuGet.exe'

describe file(executable_file) do
  it { should exist }
end
