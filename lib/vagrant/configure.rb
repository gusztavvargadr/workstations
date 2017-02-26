def vagrant_config_vm_define(directory, config, name, box, autostart = true, memory = 4096, cpus = 2)
  require "#{directory}/chef/attributes.rb"

  environment = File.basename(directory)
  ruby_name = name.tr('-', '_')

  config.vm.define name, autostart: autostart do |config_vm|
    config_vm.vm.box = box

    config_vm.vm.provider 'virtualbox' do |vb|
      vb.gui = false
      vb.memory = memory
      vb.cpus = cpus
    end

    config_vm.vm.provision 'file', source: '~/.gitconfig', destination: '/User/vagrant/.gitconfig'
    config_vm.vm.provision 'file', source: '/Windows/System32/drivers/etc/hosts', destination: '/Windows/System32/drivers/etc/hosts'

    config_vm.vm.provision 'chef_solo' do |chef|
      chef.install = false
      chef.cookbooks_path = ''
      chef.add_recipe "gusztavvargadr_workstations_#{environment}_#{ruby_name}::os"
      chef.json = vagrant_config_vm_provision_chef_attributes[ruby_name]['os']
    end

    config_vm.vm.provision :reload

    config_vm.vm.provision 'chef_solo' do |chef|
      chef.install = false
      chef.cookbooks_path = ''
      chef.add_recipe "gusztavvargadr_workstations_#{environment}_#{ruby_name}::tools"
      chef.json = vagrant_config_vm_provision_chef_attributes[ruby_name]['tools']
    end

    config_vm.vm.provision :reload

    config_vm.vm.provision 'chef_solo' do |chef|
      chef.install = false
      chef.cookbooks_path = ''
      chef.add_recipe "gusztavvargadr_workstations_#{environment}_#{ruby_name}::settings"
      chef.json = vagrant_config_vm_provision_chef_attributes[ruby_name]['settings']
    end
  end
end
