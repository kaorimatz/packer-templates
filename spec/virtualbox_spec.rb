require 'spec_helper'

describe kernel_module('vboxsf'), unless: %w(freebsd openbsd solaris).include?(os[:family]) do
  it { should be_loaded }
end

describe kernel_module('vboxfs'), if: os[:family] == 'solaris' do
  it { should be_loaded }
end

describe kernel_module('vboxguest'), unless: %w(freebsd openbsd).include?(os[:family]) do
  it { should be_loaded }
end

def dkms
  if os[:family] == 'fedora' && os[:release].to_i < 20
    'dkms_autoinstaller'
  elsif os[:family] == 'fedora'
    'dkms'
  elsif os[:family] == 'redhat' && os[:release].to_i < 7
    'dkms_autoinstaller'
  elsif os[:family] == 'redhat'
    'dkms'
  else
    nil
  end
end

describe service(dkms), if: dkms do
  it { should be_enabled }
end
