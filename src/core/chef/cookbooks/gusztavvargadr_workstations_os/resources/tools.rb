property :tools_options, Hash

default_action :install

action :install do
  return if tools_options.nil?

  gusztavvargadr_workstations_os_tools_chocolatey '' do
    tools_chocolatey_options tools_options['chocolatey']
    action :install
  end

  gusztavvargadr_workstations_os_tools_windows '' do
    tools_windows_options tools_options['windows']
    action :install
  end
end
