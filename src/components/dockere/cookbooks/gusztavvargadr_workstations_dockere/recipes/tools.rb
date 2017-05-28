powershell_script 'Install \'docker\' package' do
  code <<-EOH
    Install-Package -Name docker -ProviderName DockerMsftProvider -Force
  EOH
  action :run
  guard_interpreter :powershell_script
  not_if '(Get-Package -Name docker -ProviderName DockerMsftProvider) -ne $null'
end
