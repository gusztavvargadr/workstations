def gusztavvargadr_workstations_cookbook(type, name)
  cookbook "gusztavvargadr_workstations_#{name}", path: "#{File.dirname(__FILE__)}/#{type}/#{name}/cookbooks/gusztavvargadr_workstations_#{name}"
end

def gusztavvargadr_cookbook(name)
  cookbook "gusztavvargadr_#{name}", github: 'gusztavvargadr/chef', rel: "cookbooks/gusztavvargadr_#{name}", branch: '0.2.2'
end
