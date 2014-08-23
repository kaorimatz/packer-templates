Vagrant.configure('2') do |config|

  config.vm.synced_folder '', '/vagrant-nfs', type: 'nfs'
  config.vm.synced_folder '', '/vagrant-rsync', type: 'rsync', rsync__exclude: '.git/'

  Pathname.glob('*.json').sort.each do |template|
    name = template.basename('.json').to_s
    host = name.gsub(/[.]/, '_')
    config.vm.define host do |c|
      c.vm.box = name
      c.vm.provider :virtualbox do |vbox|
        vbox.name = name
      end
      c.vm.network :private_network, ip: '192.168.0.100'
    end
  end

  config.vm.define 'freebsd-10_0-amd64' do |c|
    c.vm.synced_folder '', '/vagrant', disabled: true
  end
  config.vm.define 'openbsd-5_5-amd64' do |c|
    c.vm.synced_folder '', '/vagrant', disabled: true
  end

end
