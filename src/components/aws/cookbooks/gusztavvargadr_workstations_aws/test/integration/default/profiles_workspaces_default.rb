query_script = 'aws configure list'
access_key_id_value = '*y_id'
secret_access_key_value = '*_key'
region_value = 'us-east-1'

describe powershell(query_script) do
  its('stdout') { should include access_key_id_value }
  its('stdout') { should include secret_access_key_value }
  its('stdout') { should include region_value }
end
