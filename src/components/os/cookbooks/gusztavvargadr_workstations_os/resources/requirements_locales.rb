property :requirements_locales_options, Hash

default_action :update

action :update do
  return if requirements_locales_options.nil?

  gusztavvargadr_workstations_os_system_locale requirements_locales_options['system'] do
    action :update
  end

  gusztavvargadr_workstations_os_ui_locale requirements_locales_options['ui'] do
    action :update
  end

  gusztavvargadr_workstations_os_user_locale requirements_locales_options['user'] do
    action :update
  end
end
