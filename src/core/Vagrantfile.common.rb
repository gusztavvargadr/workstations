def vagrant_config_vm_define(config, directory, name, box, autostart = true, memory = 4096, cpus = 2)
  environment = File.basename(directory)
  environment_ruby = environment.tr('-', '_')

  name_ruby = name.tr('-', '_')

  config.vm.define name, autostart: autostart do |config_vm|
    config_vm.vm.box = box

    config_vm.vm.provider 'virtualbox' do |vb|
      vb.gui = false
      vb.memory = memory
      vb.cpus = cpus
    end

    config_vm.vm.provision 'chef_solo' do |chef|
      chef.install = false
      chef.cookbooks_path = ''
      chef.add_recipe "gusztavvargadr_workstations_#{environment_ruby}_#{name_ruby}::requirements"
    end

    config_vm.vm.provision :reload

    config_vm.vm.provision 'chef_solo' do |chef|
      chef.install = false
      chef.cookbooks_path = ''
      chef.add_recipe "gusztavvargadr_workstations_#{environment_ruby}_#{name_ruby}::tools"
    end

    config_vm.vm.provision :reload

    config_vm.vm.provision 'chef_solo' do |chef|
      chef.install = false
      chef.cookbooks_path = ''
      chef.add_recipe "gusztavvargadr_workstations_#{environment_ruby}_#{name_ruby}::profiles"
    end
  end
end
