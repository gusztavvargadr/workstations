script = <<-EOH
  svn --version
EOH

describe powershell(script) do
  its('stdout') { should include 'svn, version' }
end
