property :box_address, String, name_property: true
property :box_options, Hash

default_action :add

action :add do
  box_name = !box_options.nil? ? box_options['name'] : nil

  powershell_script_code = "vagrant box add #{box_address}"
  powershell_script_code = "#{powershell_script_code} --name #{box_name}" unless box_name.nil?
  powershell_script "Add box #{box_address}" do
    code powershell_script_code
    action :run
  end
end
