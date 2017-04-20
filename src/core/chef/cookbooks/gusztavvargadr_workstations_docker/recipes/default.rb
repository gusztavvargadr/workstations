default_options = node['gusztavvargadr_workstations_core'].nil? ? nil : node['gusztavvargadr_workstations_core']['default']
return if default_options.nil?

include_recipe 'gusztavvargadr_workstations_docker::requirements' if default_options['requirements']
include_recipe 'gusztavvargadr_workstations_docker::tools' if default_options['tools']
include_recipe 'gusztavvargadr_workstations_docker::profiles' if default_options['profiles']
