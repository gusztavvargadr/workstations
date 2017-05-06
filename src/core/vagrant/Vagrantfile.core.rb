def system_locale(default)
  Gem.win_platform? ? powershell_out('(Get-WinSystemLocale).Name') : default
end

def ui_locale(default)
  Gem.win_platform? ? powershell_out('(Get-WinUserLanguageList)[0].LanguageTag') : default
end

def user_locale(default)
  Gem.win_platform? ? powershell_out('(Get-Culture).Name') : default
end

def timezone(default)
  Gem.win_platform? ? powershell_out('([System.TimeZone]::CurrentTimeZone).StandardName') : default
end

def powershell_out(command)
  `powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "#{command}"`.strip
end

class ::Hash
  def deep_merge(other)
    merger = proc { |key, v1, v2| Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : Array === v1 && Array === v2 ? v1 | v2 : [:undefined, nil, :nil].include?(v2) ? v1 : v2 }
    self.merge(other.to_h, &merger)
  end
end

@vagrant_config_vm_options_synced_folder_core = '/vagrant-core'

@vagrant_config_vm_options_default = {
  autostart: false,
  box: '',
  virtualbox: {
    'gui' => false,
    'memory' => 4096,
    'cpus' => 2,
  },
  chef: {
    'install' => false,
    'roles_path' => [],
    'roles' => [],
    'json' => {
      'gusztavvargadr_workstations_os' => {
        'requirements' => {
          'environment' => {
            'GUSZTAVVARGADR_WORKSTATIONS_FILES' => "#{@vagrant_config_vm_options_synced_folder_core}/files",
          },
          'locales' => {
            'system' => system_locale('en-US'),
            'ui' => ui_locale('en-US'),
            'user' => user_locale('en-US'),
          },
          'datetime' => {
            'timezone' => timezone('UTC'),
          },
        },
      },
    },
  },
}

def vagrant_config_vm_define(config, directory, machine, options = {})
  options = @vagrant_config_vm_options_default.deep_merge(options)
  environment = File.basename(directory)

  box = options[:box]
  box = box.to_s.empty? ? machine : box
  box = !box.include?('/') ? "gusztavvargadr/#{box}" : box

  box_url = File.expand_path("../boxes/#{box}.json", __FILE__)

  config.vm.define machine, autostart: options[:autostart] do |config_vm|
    config_vm.vm.box = box
    config_vm.vm.box_url = "file://#{box_url}" if File.exist?(box_url)

    config_vm.vm.provider 'virtualbox' do |vb|
      vb.gui = options[:virtualbox]['gui']
      vb.memory = options[:virtualbox]['memory']
      vb.cpus = options[:virtualbox]['cpus']
    end

    config.vm.synced_folder File.expand_path('../../', __FILE__), @vagrant_config_vm_options_synced_folder_core

    vagrant_config_vm_provision_chef config_vm, directory, environment, machine, options[:chef], 'requirements'
    config_vm.vm.provision :reload
    vagrant_config_vm_provision_chef config_vm, directory, environment, machine, options[:chef], 'tools'
    config_vm.vm.provision :reload
    vagrant_config_vm_provision_chef config_vm, directory, environment, machine, options[:chef], 'profiles'
  end
end

def vagrant_config_vm_provision_chef(config_vm, directory, environment, machine, options, stage)
  config_vm.vm.provision 'chef_solo' do |chef|
    chef.install = options['install']

    chef.cookbooks_path = ['']

    roles_path = options['roles_path']
    roles_path = [File.expand_path('../../chef/roles', __FILE__), "#{directory}/roles"] if roles_path.empty?
    chef.roles_path = roles_path

    roles = options['roles']
    if roles.empty?
      if File.exist?("#{directory}/roles/gusztavvargadr_workstations_#{environment}_#{machine}.rb")
        roles = ["gusztavvargadr_workstations_#{environment}_#{machine}"]
      elsif File.exist?("#{directory}/roles/gusztavvargadr_workstations_#{environment}.rb")
        roles = ["gusztavvargadr_workstations_#{environment}"]
      else
        roles = ['gusztavvargadr_workstations_core']
      end
    end
    roles.each do |role|
      chef.add_role role
    end

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
