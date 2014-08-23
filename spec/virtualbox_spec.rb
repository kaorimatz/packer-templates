require 'spec_helper'

describe kernel_module('vboxsf') do
  it { should be_loaded }
end

describe kernel_module('vboxguest') do
  it { should be_loaded }
end

def dkms
  if os[:family] == 'fedora' && os[:release].to_i < 20
    'dkms_autoinstaller'
  elsif os[:family] == 'fedora'
    'dkms'
  elsif os[:family] == 'redhat'
    'dkms_autoinstaller'
  else
    nil
  end
end

describe service(dkms), if: dkms do
  it { should be_enabled }
end
