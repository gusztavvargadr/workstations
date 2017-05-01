def vagrant_config_vm_define(config, directory, name, options = {})
  environment = File.basename(directory)

  options = {
    autostart: false,
    box: "gusztavvargadr/#{name}",
    gui: false,
    memory: 4096,
    cpus: 2,
    chef_install: false,
    chef_cookbooks_path: '',
    chef_cookbooks: [],
    chef_roles_path: File.expand_path('../chef/roles', __FILE__),
    chef_roles: ["gusztavvargadr_workstations_#{environment}"],
    chef_json: {
      'gusztavvargadr_workstations_os' => {
        'requirements' => {
          'environment' => {
            'GUSZTAVVARGADR_WORKSTATIONS_FILES' => '/vagrant-core/files',
          },
          'locales' => {
            'system' => powershell_out('(Get-WinSystemLocale).Name'),
            'ui' => powershell_out('(Get-WinUserLanguageList)[0].LanguageTag'),
            'user' => powershell_out('(Get-Culture).Name'),
          },
          'datetime' => {
            'timezone' => powershell_out('([System.TimeZone]::CurrentTimeZone).StandardName'),
          },
        },
      },
    },
  }.deep_merge(options)

  config.vm.define name, autostart: options[:autostart] do |config_vm|
    config_vm.vm.box = options[:box]

    config_vm.vm.provider 'virtualbox' do |vb|
      vb.gui = options[:gui]
      vb.memory = options[:memory]
      vb.cpus = options[:cpus]
    end

    config.vm.synced_folder File.expand_path('../', __FILE__), '/vagrant-core'

    vagrant_config_vm_provision_chef config_vm, 'requirements', options
    config_vm.vm.provision :reload
    vagrant_config_vm_provision_chef config_vm, 'tools', options
    config_vm.vm.provision :reload
    vagrant_config_vm_provision_chef config_vm, 'profiles', options
  end
end

class ::Hash
  def deep_merge(other)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(other.to_h, &merger)
  end
end

def powershell_out(command)
  `powershell.exe -ExecutionPolicy Bypass -Command "#{command}"`.strip
end

def vagrant_config_vm_provision_chef(config_vm, stage, options)
  config_vm.vm.provision 'chef_solo' do |chef|
    chef.install = options[:chef_install]

    chef.cookbooks_path = options[:chef_cookbooks_path]
    options[:chef_cookbooks].each do |chef_cookbook|
      chef.add_recipe "#{chef_cookbook}::default"
    end

    chef.roles_path = options[:chef_roles_path]
    options[:chef_roles].each do |chef_role|
      chef.add_role chef_role
    end

    chef.json = {
      'gusztavvargadr_workstations_core' => {
        'default' => {
          'requirements' => stage == 'requirements',
          'tools' => stage == 'tools',
          'profiles' => stage == 'profiles',
        },
      },
    }.deep_merge(options[:chef_json])
  end
end
