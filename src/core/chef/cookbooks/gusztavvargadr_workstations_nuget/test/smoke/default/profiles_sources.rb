script = <<-EOH
  NuGet sources List
EOH

describe powershell(script) do
  its('stdout') { should include 'aspnetcore-dev' }
  its('stdout') { should include 'https://dotnet.myget.org/F/aspnetcore-dev/api/v3/index.json' }
end
