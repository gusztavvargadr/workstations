property :requirements_options, Hash

default_action :ensure

action :ensure do
  return if new_resource.requirements_options.nil?

  gusztavvargadr_workstations_core_requirements_environment '' do
    requirements_environment_options new_resource.requirements_options['environment']
    action :update
  end

  gusztavvargadr_workstations_core_requirements_features '' do
    requirements_features_options new_resource.requirements_options['features']
    action :enable
  end
end
