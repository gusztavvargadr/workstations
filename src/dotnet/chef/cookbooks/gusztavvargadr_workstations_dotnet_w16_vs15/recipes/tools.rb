include_recipe 'gusztavvargadr_workstations_w::tools'

gusztavvargadr_windows_windows_updates '' do
  action [:disable]
end
