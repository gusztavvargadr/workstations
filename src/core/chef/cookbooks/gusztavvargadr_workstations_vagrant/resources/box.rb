property :box_address, String, name_property: true
property :box_options, Hash

default_action :add

action :add do
  powershell_script "Add box #{box_address}" do
    code <<-EOH
      vagrant box add #{box_address}
    EOH
    action :run
  end
end
