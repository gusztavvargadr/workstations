property :requirements_environment_options, Hash

default_action :update

action :update do
  return if new_resource.requirements_environment_options.nil?

  new_resource.requirements_environment_options.each do |environment_variable_name, environment_variable_value|
    gusztavvargadr_workstations_core_environment_variable environment_variable_name do
      environment_variable_value environment_variable_value
      action :update
    end
  end
end
