property :image_name, String, name_property: true
property :image_options, Hash

default_action :pull

action :pull do
  gusztavvargadr_windows_powershell_script_elevated "Pull image #{image_name}" do
    code <<-EOH
      docker pull #{image_name}
    EOH
    action :run
  end
end
