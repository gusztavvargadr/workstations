property :source_name, String, name_property: true
property :source_base_address, String, required: true
property :source_username, String
property :source_password, String
property :source_options, Hash

default_action :create

action :create do
  return if new_resource.source_options.nil?

  source_address = "#{new_resource.source_base_address}/#{new_resource.source_options['address']}"
  source_script = "NuGet sources Add -Name #{new_resource.source_name} -Source #{source_address}"

  unless new_resource.source_username.to_s.empty? || new_resource.source_password.to_s.empty?
    source_script = "#{source_script} -UserName #{new_resource.source_username} -Password #{new_resource.source_password} -StorePasswordInClearText"
  end

  powershell_script "Create NuGet source #{new_resource.source_name}" do
    code source_script
    action :run
    guard_interpreter :powershell_script
    not_if "((NuGet sources List -Format Short) | Out-String).Contains(\"#{source_address}\")"
  end
end
