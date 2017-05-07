require 'yaml'
require 'erb'

@options = {}

def gusztavvargadr_workstations_core(config)
  @options = gusztavvargadr_workstations_yml(File.expand_path('..', __FILE__))
end

def gusztavvargadr_workstations_vm(config, directory, vm)
  options = @options.deep_merge(gusztavvargadr_workstations_yml(directory))
  options = options['default'].deep_merge(options[vm])

  environment = File.basename(directory)

  config.vm.define vm, primary: options['primary'], autostart: options['autostart'] do |config_vm|
    box = options['box']
    box = vm if box.to_s.empty?
    box = "gusztavvargadr/#{box}" unless box.include?('/')
    config_vm.vm.box = box

    box_url = File.expand_path("../boxes/#{box}.json", __FILE__)
    config_vm.vm.box_url = "file://#{box_url}" if File.exist?(box_url)

    options_virtualbox = options['virtualbox']
    config_vm.vm.provider 'virtualbox' do |vb|
      vb.gui = options_virtualbox['gui']
      vb.memory = options_virtualbox['memory']
      vb.cpus = options_virtualbox['cpus']
    end

    config_vm.vm.synced_folder File.expand_path('../../', __FILE__), options['synced_folder_core_destination']

    options_chef = options['chef']
    gusztavvargadr_workstations_vm_chef config_vm, directory, environment, vm, options_chef, 'requirements'
    config_vm.vm.provision :reload
    gusztavvargadr_workstations_vm_chef config_vm, directory, environment, vm, options_chef, 'tools'
    config_vm.vm.provision :reload
    gusztavvargadr_workstations_vm_chef config_vm, directory, environment, vm, options_chef, 'profiles'
  end
end

def gusztavvargadr_workstations_vm_chef(config_vm, directory, environment, vm, options, stage)
  config_vm.vm.provision 'chef_solo' do |chef|
    chef.install = options['install']

    chef.cookbooks_path = ['']

    roles_path = [File.expand_path('../../chef/roles', __FILE__)]
    role = 'gusztavvargadr_workstations_core'
    environment_roles_path = "#{directory}/roles"
    if Dir.exist?(environment_roles_path)
      roles_path.push environment_roles_path
      environment_role = "gusztavvargadr_workstations_#{environment}"
      vm_role = "gusztavvargadr_workstations_#{environment}_#{vm}"
      if File.exist?("#{environment_roles_path}/#{vm_role}.rb")
        role = vm_role
      elsif File.exist?("#{environment_roles_path}/#{environment_role}.rb")
        role = environment_role
      end
    end
    chef.roles_path = roles_path
    chef.add_role role

    chef.json = {
      'gusztavvargadr_workstations_core' => {
        'default' => {
          'requirements' => stage == 'requirements',
          'tools' => stage == 'tools',
          'profiles' => stage == 'profiles',
        },
      },
    }.deep_merge(options['json'])
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
