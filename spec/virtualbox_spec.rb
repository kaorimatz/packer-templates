require 'spec_helper'

def vboxsf
  return unless virtualbox?

  case os[:family]
  when 'freebsd', 'openbsd', 'solaris'
    nil
  else
    'vboxsf'
  end
end

def vboxfs
  return unless virtualbox?

  if os[:family] == 'solaris'
    'vboxfs'
  else
    nil
  end
end

def vboxguest
  return unless virtualbox?

  case os[:family]
  when 'freebsd', 'openbsd'
    nil
  else
    'vboxguest'
  end
end

def dkms
  return unless virtualbox?

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

describe kernel_module(vboxsf), if: vboxsf do
  it { should be_loaded }
end

describe kernel_module(vboxfs), if: vboxfs do
  it { should be_loaded }
end

describe kernel_module(vboxguest), if: vboxguest do
  it { should be_loaded }
end

describe service(dkms), if: dkms do
  it { should be_enabled }
end
