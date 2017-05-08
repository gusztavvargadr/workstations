require 'yaml'
require 'erb'

@options = {}

def gusztavvargadr_workstations_core(config)
  @options = gusztavvargadr_workstations_yml(File.expand_path('..', __FILE__))
end

def gusztavvargadr_workstations_vm(config, directory, vm)
  options = @options.deep_merge(gusztavvargadr_workstations_yml(directory))
  options = options['default'].deep_merge(options[vm])

  config.vm.define vm, primary: options['default'], autostart: options['default'] do |config_vm|
    box = options['box']
    box = vm if box.to_s.empty?
    box = "gusztavvargadr/#{box}" unless box.include?('/')
    config_vm.vm.box = box

    box_url = File.expand_path("../boxes/#{box}.json", __FILE__)
    config_vm.vm.box_url = "file://#{box_url}" if File.exist?(box_url)

    config_vm.vm.provider 'virtualbox' do |vb|
      vb.gui = options['virtualbox']['gui']
      vb.memory = options['virtualbox']['memory']
      vb.cpus = options['virtualbox']['cpus']
    end

    config_vm.vm.synced_folder File.expand_path('../../', __FILE__), options['synced_folder_core_destination']

    options_chef = options['chef']
    gusztavvargadr_workstations_vm_chef config_vm, options_chef, 'requirements'
    config_vm.vm.provision :reload
    gusztavvargadr_workstations_vm_chef config_vm, options_chef, 'tools'
    config_vm.vm.provision :reload
    gusztavvargadr_workstations_vm_chef config_vm, options_chef, 'profiles'
  end
end

def gusztavvargadr_workstations_vm_chef(config_vm, options, stage)
  config_vm.vm.provision 'chef_solo' do |chef|
    chef.install = options['install']

    chef.cookbooks_path = ['']
    options['cookbooks'].each do |cookbook|
      chef.add_recipe "#{cookbook}::#{stage}"
    end

    chef.json = options['json']
  end
end

def gusztavvargadr_workstations_yml(directory)
  yml_path = "#{directory}/vagrant.yml"
  return {} unless File.exist?(yml_path)
  YAML.load(ERB.new(File.read(yml_path)).result)
end

class ::Hash
  def deep_merge(other)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(other.to_h, &merger)
  end
end
