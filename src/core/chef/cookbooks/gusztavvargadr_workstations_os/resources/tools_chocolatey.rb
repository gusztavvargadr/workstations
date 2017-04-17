property :tools_chocolatey_options, Hash

default_action :install

action :install do
  return if tools_chocolatey_options.nil?

  tools_chocolatey_options.each do |package_name, package_options|
    package_version = package_options.nil? ? '' : package_options['version']
    package_install = '--ignorechecksums'
    unless package_options.nil?
      if package_options['ignorecodes']
        package_install = "#{package_install} --ignorepackagecodes"
      end
      unless package_options['install'].nil?
        package_install = "#{package_install} #{package_options['install']}"
      end
    end

    chocolatey_package package_name do
      version package_version
      options package_install
      action :install
    end
  end
end
