include_recipe 'gusztavvargadr_workstations_common::requirements'

gusztavvargadr_windows_windows_feature 'TelnetClient' do
  action :enable
end
