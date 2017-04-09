default_action :install

action :install do
  chocolatey_packages = %w(nuget.commandline)
  chocolatey_packages.each do |chocolatey_package_name|
    chocolatey_package chocolatey_package_name do
      action :install
    end
  end

  cookbook_file "#{ENV['APPDATA']}/NuGet/NuGet.config" do
    source 'NuGet.config'
    cookbook 'gusztavvargadr_workstations_nuget'
    action :create
  end
end
