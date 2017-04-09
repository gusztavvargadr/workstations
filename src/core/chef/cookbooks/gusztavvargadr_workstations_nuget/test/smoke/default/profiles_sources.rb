query_script = <<-EOH
  NuGet sources List
EOH
name = 'aspnetcore-dev'
address = 'https://dotnet.myget.org/F/aspnetcore-dev/api/v3/index.json'

describe powershell(query_script) do
  its('stdout') { should include name }
  its('stdout') { should include address }
end
