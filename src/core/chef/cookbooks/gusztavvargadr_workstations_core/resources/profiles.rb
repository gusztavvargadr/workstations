property :profiles_options, Hash

default_action :create

action :create do
  return if profiles_options.nil?
end
