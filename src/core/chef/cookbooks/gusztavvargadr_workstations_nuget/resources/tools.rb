property :tools_options, Hash

default_action :install

action :install do
  return if tools_options.nil?

  gusztavvargadr_workstations_os_tools '' do
    tools_options new_resource.tools_options
    action :install
  end
end
