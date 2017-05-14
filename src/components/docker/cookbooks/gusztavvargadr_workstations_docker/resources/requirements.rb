property :requirements_options, Hash

default_action :ensure

action :ensure do
  return if requirements_options.nil?

  gusztavvargadr_workstations_core_requirements '' do
    requirements_options new_resource.requirements_options
    action :ensure
  end

  gusztavvargadr_windows_powershell_script_elevated 'Install Docker module' do
    code <<-EOH
      Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
    EOH
    action :run
    guard_interpreter :powershell_script
    not_if '(Get-Module -Name DockerMsftProvider -ListAvailable) -ne $null'
  end
end
