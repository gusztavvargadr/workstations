property :profiles_images_options, Hash

default_action :pull

action :pull do
  return if new_resource.profiles_images_options.nil?

  new_resource.profiles_images_options.each do |image_name, image_options|
    gusztavvargadr_workstations_dockerc_image image_name do
      image_options image_options
      action :pull
    end
  end
end
