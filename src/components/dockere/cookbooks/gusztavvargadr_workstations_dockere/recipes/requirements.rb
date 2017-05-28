powershell_script 'Install \'docker\' module' do
  code <<-EOH
    Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
  EOH
  action :run
  guard_interpreter :powershell_script
  not_if '(Get-Module -Name DockerMsftProvider -ListAvailable) -ne $null'
end
