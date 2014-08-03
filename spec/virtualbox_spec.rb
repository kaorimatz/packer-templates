require 'spec_helper'

describe kernel_module('vboxsf') do
  it { should be_loaded }
end

describe kernel_module('vboxguest') do
  it { should be_loaded }
end

describe interface('eth0') do
  it { should have_ipv4_address('10.0.2.15') }
end

describe default_gateway do
  its(:ipaddress) { should eq '10.0.2.2' }
  its(:interface) { should eq 'eth0' }
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
