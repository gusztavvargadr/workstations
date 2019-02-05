property :profiles_options, Hash

default_action :create

action :create do
  return if new_resource.profiles_options.nil?

  gusztavvargadr_workstations_dockere_profiles_images '' do
    profiles_images_options new_resource.profiles_options['images']
    action :pull
  end
end
