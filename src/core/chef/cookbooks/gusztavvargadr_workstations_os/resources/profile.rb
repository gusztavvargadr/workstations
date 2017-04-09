property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :create

action :create do
  return if profile_options.nil?
end
