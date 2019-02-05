property :tools_windows_options, Hash

default_action :install

action :install do
  return if new_resource.tools_windows_options.nil?

  new_resource.tools_windows_options.each do |package_name, package_options|
    package_options = {} if package_options.nil?

    package_source = package_options['source']
    package_install = package_options['install'].nil? ? {} : package_options['install']
    package_directory = package_options['directory']
    package_elevated = package_options['elevated']

    next if !package_directory.nil? && ::Dir.exist?(package_directory)

    package_download_directory_path = "#{Chef::Config[:file_cache_path]}/gusztavvargadr_workstations_core"

    directory package_download_directory_path do
      recursive true
      action :create
    end

    package_download_file_path = "#{package_download_directory_path}/#{package_name.tr(' ', '-')}.exe"
    remote_file package_download_file_path do
      source package_source
      action :create
    end

    package_script_name = "Install Windows package '#{package_name}'"
    package_script_code = "Start-Process \"#{package_download_file_path.tr('/', '\\')}\" \"#{package_install.join(' ')}\" -Wait"

    if package_elevated
      gusztavvargadr_windows_powershell_script_elevated package_script_name do
        code package_script_code
        action :run
      end
    else
      powershell_script package_script_name do
        code package_script_code
        action :run
      end
    end
  end
end
