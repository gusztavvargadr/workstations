property :requirements_datetime_options, Hash

default_action :update

action :update do
  return if new_resource.requirements_datetime_options.nil?

  gusztavvargadr_workstations_os_timezone new_resource.requirements_datetime_options['timezone'] do
    action :update
  end
end
