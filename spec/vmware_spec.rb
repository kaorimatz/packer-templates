require 'spec_helper'

def in_vmware?
  host_inventory[:virtualization][:system] == 'vmware'
end

def vmhgfs
  return nil unless in_vmware?

  if %w(centos debian).include?(os[:family])
    'vmhgfs'
  elsif os[:family] == 'ubuntu' && os[:release] != '16.04'
    'vmhgfs'
  else
    nil
  end
end

describe kernel_module(vmhgfs), if: vmhgfs do
  it { should be_loaded }
end
