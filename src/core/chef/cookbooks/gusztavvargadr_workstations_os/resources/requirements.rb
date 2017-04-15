property :requirements_options, Hash

default_action :ensure

action :ensure do
  return if requirements_options.nil?

  gusztavvargadr_workstations_os_requirements_locales '' do
    requirements_locales_options requirements_options['locales']
    action :update
  end

  gusztavvargadr_workstations_os_requirements_datetime '' do
    requirements_datetime_options requirements_options['datetime']
    action :update
  end

  gusztavvargadr_workstations_os_requirements_environment '' do
    requirements_environment_options requirements_options['environment']
    action :update
  end

  gusztavvargadr_workstations_os_requirements_features '' do
    requirements_features_options requirements_options['features']
    action :enable
  end
end
