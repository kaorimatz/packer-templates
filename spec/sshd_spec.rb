require 'spec_helper'

def openssh
  case os[:family]
  when 'arch'
    'openssh'
  else
    'openssh-server'
  end
end

describe package(openssh) do
  it { should be_installed }
end

def sshd
  case os[:family]
  when /(debian|ubuntu)/
    'ssh'
  else
    'sshd'
  end
end

describe service(sshd) do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/ssh/sshd_config') do
  its(:content) { should match /UseDNS no/ }
end
