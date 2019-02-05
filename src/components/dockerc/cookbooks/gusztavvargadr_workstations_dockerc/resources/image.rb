property :image_name, String, name_property: true
property :image_options, Hash

default_action :pull

action :pull do
  image_script_name = "docker pull #{new_resource.image_name}"
  image_script_code = <<-EOH
    timeout /t 120 > nul
    docker pull #{new_resource.image_name}
  EOH
  image_script_directory_path = "#{Chef::Config[:file_cache_path]}/gusztavvargadr_workstations_dockerc"
  directory image_script_directory_path do
    recursive true
    action :create
  end

  image_script_file_name = "#{image_script_name.tr(' ', '-').tr(':', '-').tr('/', '-')}.cmd"
  image_script_file_path = "#{image_script_directory_path}/#{image_script_file_name}"
  file image_script_file_path do
    content image_script_code
    action :create
  end

  windows_task image_script_file_name do
    command image_script_file_name
    cwd image_script_directory_path
    run_level :highest
    frequency :on_logon
    force true
    action :create
  end
end
