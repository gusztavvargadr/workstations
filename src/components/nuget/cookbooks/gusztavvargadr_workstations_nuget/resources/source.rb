property :source_name, String, name_property: true
property :source_base_address, String, required: true
property :source_username, String
property :source_password, String
property :source_options, Hash

default_action :create

action :create do
  return if source_options.nil?

  source_address = "#{source_base_address}/#{source_options['address']}"
  source_script = "NuGet sources Add -Name #{source_name} -Source #{source_address}"

  unless source_username.to_s.empty? || source_password.to_s.empty?
    source_script = "#{source_script} -UserName #{source_username} -Password #{source_password} -StorePasswordInClearText"
  end

  powershell_script "Create NuGet source #{source_name}" do
    code source_script
    action :run
    guard_interpreter :powershell_script
    not_if "((NuGet sources List -Format Short) | Out-String).Contains(\"#{source_address}\")"
  end
end
