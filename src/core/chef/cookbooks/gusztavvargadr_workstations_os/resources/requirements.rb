property :requirements_options, Hash

default_action :ensure

action :ensure do
  return if requirements_options.nil?

  gusztavvargadr_workstations_core_requirements '' do
    requirements_options new_resource.requirements_options
    action :ensure
  end

  gusztavvargadr_workstations_os_requirements_locales '' do
    requirements_locales_options requirements_options['locales']
    action :update
  end

  gusztavvargadr_workstations_os_requirements_datetime '' do
    requirements_datetime_options requirements_options['datetime']
    action :update
  end
end
