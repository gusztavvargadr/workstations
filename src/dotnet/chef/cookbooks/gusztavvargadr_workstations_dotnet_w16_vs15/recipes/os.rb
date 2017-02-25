include_recipe 'gusztavvargadr_workstations_w::os'

gusztavvargadr_windows_windows_updates '' do
  action [:enable, :start]
end

gusztavvargadr_windows_powershell_script_elevated 'Install Docker' do
  code <<-EOH
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    Install-Package -Name docker -ProviderName DockerMsftProvider -Force
  EOH
  action :run
end
