Vagrant.configure('2') do |config|
  config.vm.synced_folder '', '/vagrant', disabled: true
  config.vm.provider :vmware_fusion do |v|
    v.functional_hgfs = false
  end
  config.vm.provider :vmware_workstation do |v|
    v.functional_hgfs = false
  end
end
