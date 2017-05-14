property :tools_options, Hash

default_action :install

action :install do
  return if tools_options.nil?

  tools_custom_options = tools_options['custom']
  return if tools_custom_options.nil?

  tools_custom_options.each do |package_name, package_options|
    package_source = package_options.nil? ? nil : package_options['source']
    package_install = package_options.nil? ? nil : package_options['install']
    package_directory = package_options.nil? ? nil : package_options['directory']

    skip if !package_directory.nil? && ::Dir.exist?(package_directory)

    directory_path = "#{Chef::Config[:file_cache_path]}/gusztavvargadr_workstations_ssms/#{package_name}"

    directory directory_path do
      recursive true
      action :create
    end

    installer_file_name = 'SSMS-Setup-ENU.exe'
    installer_file_path = "#{directory_path}/#{installer_file_name}"
    remote_file installer_file_path do
      source package_source
      action :create
    end

    gusztavvargadr_windows_powershell_script_elevated "Install #{package_name}" do
      code <<-EOH
        Start-Process "#{installer_file_path.tr('/', '\\')}" "#{package_install}" -Wait
      EOH
      action :run
    end
  end

  gusztavvargadr_workstations_core_tools '' do
    tools_options new_resource.tools_options
    action :install
  end
end
