script = <<-EOH
  NuGet
EOH

describe powershell(script) do
  its('stdout') { should include 'NuGet Version:' }
end
