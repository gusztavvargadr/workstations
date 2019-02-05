property :profiles_options, Hash

default_action :create

action :create do
  return if new_resource.profiles_options.nil?

  gusztavvargadr_workstations_vagrant_profiles_plugins '' do
    profiles_plugins_options new_resource.profiles_options['plugins']
    action :install
  end

  gusztavvargadr_workstations_vagrant_profiles_boxes '' do
    profiles_boxes_options new_resource.profiles_options['boxes']
    action :add
  end
end
