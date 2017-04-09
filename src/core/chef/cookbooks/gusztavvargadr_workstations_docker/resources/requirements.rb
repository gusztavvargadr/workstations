default_action :install

action :install do
  gusztavvargadr_windows_powershell_script_elevated 'Install Docker Module' do
    code <<-EOH
      Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    EOH
    action :run
    guard_interpreter :powershell_script
    not_if '(Get-Module -Name DockerMsftProvider -ListAvailable) -ne $null'
  end
end
