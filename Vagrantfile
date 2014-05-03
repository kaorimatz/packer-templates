Vagrant.configure('2') do |config|
  Pathname.glob('*.json').sort.each do |template|
    name = template.basename('.json').to_s
    host = name.gsub(/[.]/, '_')
    config.vm.define host do |c|
      c.vm.box = name
      config.vm.provider :virtualbox do |vbox|
        vbox.name = name
      end
    end
  end
  config.vm.define 'freebsd-10_0-amd64' do |c|
    c.vm.synced_folder '', '/vagrant', disabled: true
  end
  config.vm.define 'openbsd-5_5-amd64' do |c|
    c.vm.synced_folder '', '/vagrant', disabled: true
  end
end
