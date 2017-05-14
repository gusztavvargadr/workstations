query_script = <<-EOH
  aws configure list
EOH
access_key_id = '*y_id'
secret_access_key = '*_key'
region = 'us-east-1'

describe powershell(query_script) do
  its('stdout') { should include access_key_id }
  its('stdout') { should include secret_access_key }
  its('stdout') { should include region }
end
