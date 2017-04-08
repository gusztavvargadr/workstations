default_action :install

action :install do
  chocolatey_package 'git' do
    version '2.11.1'
    options '-params \'"/GitAndUnixToolsOnPath /NoShellIntegration"\''
    action :install
  end

  cookbook_file "#{ENV['HOME']}/.gitconfig" do
    source 'gitconfig'
    cookbook 'gusztavvargadr_workstations_git'
    action :create
  end

  chocolatey_packages = %w(poshgit gitkraken)
  chocolatey_packages.each do |chocolatey_package_name|
    chocolatey_package chocolatey_package_name do
      action :install
    end
  end

  cookbook_file "#{ENV['HOME']}/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1" do
    source 'Microsoft.PowerShell_profile.ps1'
    cookbook 'gusztavvargadr_workstations_git'
    action :create
  end
end
