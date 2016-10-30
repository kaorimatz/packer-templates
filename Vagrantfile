Vagrant.configure('2') do |config|
  Pathname.glob('*.json').sort.each do |template|
    name = template.basename('.json').to_s
    host = name.gsub(/[.]/, '_')

    config.vm.define host do |c|
      c.vm.box = name
      7.times do
        c.vm.network :private_network, type: :dhcp
      end

      c.vm.provider :libvirt do |v, override|
        override.vm.synced_folder '', '/vagrant', disabled: true
      end

      c.vm.provider :virtualbox do |v|
        v.name = name
        v.gui = false
      end

      c.vm.provider :vmware_fusion do |v|
        v.gui = false
      end
    end
  end
end
