require 'yaml'
require 'erb'

def gusztavvargadr_workstations_vm(config, vm_directory, vm)
  src_directory = File.dirname(__FILE__)
  includes = ["#{(Pathname.new vm_directory).relative_path_from (Pathname.new src_directory)}/#{vm}"]
  options = gusztavvargadr_workstations_vm_options(src_directory, includes)

  config.vm.define vm, primary: options['default'], autostart: options['default'] do |config_vm|
    box = options['box']
    box = vm if box.to_s.empty?
    box = "gusztavvargadr/#{box}" unless box.include?('/')
    config_vm.vm.box = box

    box_url = "#{src_directory}/boxes/#{box}.json"
    config_vm.vm.box_url = "file://#{box_url}" if File.exist?(box_url)

    config_vm.vm.provider 'hyperv' do |h, override|
      h.memory = options['provider']['memory']
      h.cpus = options['provider']['cpus']
      h.enable_virtualization_extensions = true
      h.differencing_disk = true if options['provider']['linked_clone']
      override.vm.network 'private_network', bridge: ENV['VAGRANT_NETWORK_BRIDGE']
      override.vm.synced_folder '.', '/vagrant', smb_username: ENV['VAGRANT_SMB_USERNAME'], smb_password: ENV['VAGRANT_SMB_PASSWORD']
    end

    config_vm.vm.provider 'virtualbox' do |vb|
      vb.memory = options['provider']['memory']
      vb.cpus = options['provider']['cpus']
      vb.linked_clone = true if options['provider']['linked_clone']
    end

    config_vm.vm.synced_folder "#{src_directory}/..", '/vagrant-workstations'

    options_chef = options['chef']
    gusztavvargadr_workstations_vm_chef config_vm, options_chef, 'requirements'
    config_vm.vm.provision :reload
    gusztavvargadr_workstations_vm_chef config_vm, options_chef, 'tools'
    config_vm.vm.provision :reload
    gusztavvargadr_workstations_vm_chef config_vm, options_chef, 'profiles'
  end
end

def gusztavvargadr_workstations_vm_options(src_directory, includes)
  options = {}
  unless includes.nil?
    includes.each do |include|
      include_parts = include.split('/')
      next if include_parts.length != 3

      include_type = include_parts[0]
      include_name = include_parts[1]
      include_version = include_parts[2]

      options_current = gusztavvargadr_workstations_yml(src_directory, include_type, include_name)[include_version]
      puts include if options_current.nil?
      options = options.deep_merge(gusztavvargadr_workstations_vm_options(src_directory, options_current['includes']).deep_merge(options_current))
    end
  end
  options
end

def gusztavvargadr_workstations_yml(src_directory, type, name)
  yml_path = "#{src_directory}/#{type}/#{name}/vagrant.yml"
  return {} unless File.exist?(yml_path)
  YAML.load(ERB.new(File.read(yml_path)).result)
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

class ::Hash
  def deep_merge(other)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(other.to_h, &merger)
  end
end
