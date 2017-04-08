property :source_name, String, name_property: true
property :source_options, Hash

default_action :create

action :create do
  return if source_options.nil?

  source_address = source_options['address']
  source_script = "NuGet sources Add -Name #{source_name} -Source #{source_address}"

  source_username = source_options['username']
  source_password = source_options['password']
  unless source_username.nil? || source_password.nil?
    source_script = "#{source_script} -UserName #{source_username} -Password #{source_password} -StorePasswordInClearText"
  end

  powershell_script "Create NuGet source #{source_name}" do
    code source_script
    action :run
  end
end
