version_query_script = <<-EOH
  svn --version
EOH
version_value = 'svn, version'

describe powershell(version_query_script) do
  its('stdout') { should include version_value }
end
