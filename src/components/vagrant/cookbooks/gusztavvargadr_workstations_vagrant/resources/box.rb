property :box_name, String, name_property: true
property :box_options, Hash

default_action :add

action :add do
  box_address = !box_options.nil? ? box_options['address'] : nil

  powershell_script_code = 'vagrant box add'
  if box_address.nil?
    powershell_script_code = "#{powershell_script_code} #{box_name}"
  else
    powershell_script_code = "#{powershell_script_code} #{box_address} --name #{box_name}"
  end
  powershell_script_guard = "((vagrant box list) | Out-String).Contains(\"#{box_name}\")"
  powershell_script "Add box '#{box_name}'" do
    code powershell_script_code
    action :run
    guard_interpreter :powershell_script
    not_if powershell_script_guard
  end
end
