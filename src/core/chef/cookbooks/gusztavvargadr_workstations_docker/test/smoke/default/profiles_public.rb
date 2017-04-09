images_query_script = <<-EOH
  docker images
EOH
image_name = 'microsoft/nanoserver'

describe powershell(images_query_script) do
  its('stdout') { should include image_name }
end
