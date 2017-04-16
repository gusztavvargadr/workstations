property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  gusztavvargadr_workstations_os_profiles '' do
    profiles_options new_resource.profiles_options
    action :create
  end

  gusztavvargadr_workstations_vagrant_profiles_plugins '' do
    profiles_plugins_options profiles_options['plugins']
    action :install
  end

  gusztavvargadr_workstations_vagrant_profiles_boxes '' do
    profiles_boxes_options profiles_options['boxes']
    action :add
  end
end
