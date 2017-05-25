property :requirements_options, Hash

default_action :ensure

action :ensure do
  return if requirements_options.nil?

  gusztavvargadr_workstations_core_requirements '' do
    requirements_options new_resource.requirements_options
    action :ensure
  end

  gusztavvargadr_windows_powershell_script_elevated "Enable Windows Feature 'Hyper-V'" do
    code <<-EOH
      Install-WindowsFeature -Name Hyper-V -IncludeManagementTools
    EOH
  end
end
