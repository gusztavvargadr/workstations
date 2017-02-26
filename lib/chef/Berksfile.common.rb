source 'https://supermarket.chef.io'

def src_cookbook(name)
  cookbook "gusztavvargadr_workstations_#{name}", path: "chef/cookbooks/gusztavvargadr_workstations_#{name}"
end

def lib_cookbook(name)
  cookbook "gusztavvargadr_workstations_#{name}", path: "../../lib/chef/cookbooks/gusztavvargadr_workstations_#{name}"
end

def gusztavvargadr_cookbook(name)
  cookbook "gusztavvargadr_#{name}", '~> 0.1.0', github: 'gusztavvargadr/chef', rel: "cookbooks/gusztavvargadr_#{name}"
end
