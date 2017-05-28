Vagrant.configure('2') do |config|
  config.vm.box = 'gusztavvargadr/w10e'

  config.vm.provider 'hyperv' do |h, override|
    h.memory = 4096
    h.cpus = 2
    h.enable_virtualization_extensions = true
    h.differencing_disk = true
    override.vm.network 'private_network', bridge: ENV['VAGRANT_NETWORK_BRIDGE']
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 4096
    vb.cpus = 2
    vb.linked_clone = true
  end
end
