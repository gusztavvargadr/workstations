default_options = node['gusztavvargadr_workstations_core'].nil? ? nil : node['gusztavvargadr_workstations_core']['default']
return if default_options.nil?

include_recipe 'gusztavvargadr_workstations_vagrant::requirements' if default_options['requirements']
include_recipe 'gusztavvargadr_workstations_vagrant::tools' if default_options['tools']
include_recipe 'gusztavvargadr_workstations_vagrant::profiles' if default_options['profiles']
