property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :create

action :create do
  return if profile_options.nil?

  profile_images = profile_options['images']
  unless profile_images.nil?
    profile_images.each do |profile_image_name, profile_image_options|
      gusztavvargadr_workstations_docker_image profile_image_name do
        image_options profile_image_options
        action :pull
      end
    end
  end
end
