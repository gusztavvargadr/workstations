property :image_name, String, name_property: true
property :image_options, Hash

default_action :pull

action :pull do
  powershell_script "docker pull #{image_name}" do
    code <<-EOH
      docker pull #{image_name}
    EOH
    action :run
  end
end
