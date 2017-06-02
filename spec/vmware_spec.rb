require 'spec_helper'

def vmhgfs
  return unless vmware?

  if %w(centos debian).include?(os[:family])
    'vmhgfs'
  elsif os[:family] == 'ubuntu' && os[:release] == '12.04'
    'vmhgfs'
  else
    nil
  end
end

describe kernel_module(vmhgfs), if: vmhgfs do
  it { should be_loaded }
end
