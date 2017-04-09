query_script = <<-EOH
  (Get-WinSystemLocale).Name
EOH
value = 'en-GB'

describe powershell(query_script) do
  its('stdout') { should include value }
end
