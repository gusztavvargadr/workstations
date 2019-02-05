property :tools_chocolatey_options, Hash

default_action :install

action :install do
  return if new_resource.tools_chocolatey_options.nil?

  new_resource.tools_chocolatey_options.each do |package_name, package_options|
    package_options = {} if package_options.nil?

    package_version = package_options['version']
    package_install = package_options['install'].nil? ? {} : package_options['install']
    package_elevated = package_options['elevated']

    package_script_name = "Install Chocolatey package '#{package_name}'"
    package_script_code = "choco install #{package_name} --confirm --no-progress"
    package_script_code = "#{package_script_code} --version #{package_version}" unless package_version.nil?
    package_install.each do |package_install_name, package_install_value|
      package_script_code = "#{package_script_code} --#{package_install_name}"
      package_script_code = "#{package_script_code} #{package_install_value}" unless package_install_value.nil? 
    end

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
