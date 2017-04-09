property :profile_name, String, name_property: true
property :profile_options, Hash

default_action :install

action :install do
  return if profile_options.nil?
end
