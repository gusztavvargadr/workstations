property :tools_options, Hash

default_action :install

action :install do
  return if tools_options.nil?

  gusztavvargadr_windows_windows_updates '' do
    action [:enable, :start]
  end

  gusztavvargadr_windows_powershell_script_elevated 'Install Docker package' do
    code <<-EOH
      Install-Package -Name docker -ProviderName DockerMsftProvider -Force
    EOH
    action :run
    guard_interpreter :powershell_script
    not_if '(Get-Package -Name docker -ProviderName DockerMsftProvider) -ne $null'
  end

  gusztavvargadr_windows_windows_updates '' do
    action [:disable]
  end

  gusztavvargadr_workstations_core_tools '' do
    tools_options new_resource.tools_options
    action :install
  end
end
