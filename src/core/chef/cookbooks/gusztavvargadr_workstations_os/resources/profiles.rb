property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  directory "#{ENV['APPDATA']}/Code/User" do
    recursive true
    action :create
  end

  cookbook_file "#{ENV['APPDATA']}/Code/User/settings.json" do
    source 'settings.json'
    cookbook 'gusztavvargadr_workstations_os'
    action :create
  end
end
