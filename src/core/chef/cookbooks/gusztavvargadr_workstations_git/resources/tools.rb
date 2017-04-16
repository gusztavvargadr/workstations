property :tools_options, Hash

default_action :install

action :install do
  return if tools_options.nil?

  gusztavvargadr_workstations_os_tools '' do
    tools_options new_resource.tools_options
    action :install
  end

  directory "#{ENV['USERPROFILE']}/Documents/WindowsPowerShell" do
    recursive true
    action :create
  end

  cookbook_file "#{ENV['USERPROFILE']}/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1" do
    source 'Microsoft.PowerShell_profile.ps1'
    cookbook 'gusztavvargadr_workstations_git'
    action :create
  end
end
