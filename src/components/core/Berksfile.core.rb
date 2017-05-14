source 'https://supermarket.chef.io'

def gusztavvargadr_workstations_cookbook(src_directory, type, name)
  cookbook "gusztavvargadr_workstations_#{name}", path: "#{src_directory}/#{type}/#{name}/cookbooks/gusztavvargadr_workstations_#{name}"
end

def gusztavvargadr_cookbook(name)
  cookbook "gusztavvargadr_#{name}", github: 'gusztavvargadr/chef', rel: "cookbooks/gusztavvargadr_#{name}", branch: '0.2.2'
end
