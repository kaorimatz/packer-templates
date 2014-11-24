Vagrant.configure('2') do |config|
  config.ssh.shell = 'sh'
  config.vm.synced_folder '', '/vagrant', disabled: true
  config.vm.provider :virtualbox do |vbox|
    vbox.check_guest_additions = false
    vbox.functional_vboxsf = false
  end
end
