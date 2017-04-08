default_action :install

action :install do
  chocolatey_packages = %w(svn tortoisesvn)
  chocolatey_packages.each do |chocolatey_package_name|
    chocolatey_package chocolatey_package_name do
      action :install
    end
  end
end
