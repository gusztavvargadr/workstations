property :requirements_locales_options, Hash

default_action :update

action :update do
  return if new_resource.requirements_locales_options.nil?

  gusztavvargadr_workstations_os_system_locale new_resource.requirements_locales_options['system'] do
    action :update
  end

  gusztavvargadr_workstations_os_ui_locale new_resource.requirements_locales_options['ui'] do
    action :update
  end

  gusztavvargadr_workstations_os_user_locale new_resource.requirements_locales_options['user'] do
    action :update
  end
end
