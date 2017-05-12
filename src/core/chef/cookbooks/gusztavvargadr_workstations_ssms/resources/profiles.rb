property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?

  gusztavvargadr_workstations_core_profiles '' do
    profiles_options new_resource.profiles_options
    action :create
  end
end
