default_action :install

action :install do
  gusztavvargadr_windows_windows_updates '' do
    action [:enable, :start]
  end

  gusztavvargadr_windows_powershell_script_elevated 'Install Docker Package' do
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
end
