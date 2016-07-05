require 'spec_helper'

def ssh_server_package
  case os[:family]
  when 'arch'
    'openssh'
  when 'solaris'
    'network/openssh-server'
  else
    'openssh-server'
  end
end

describe package(ssh_server_package) do
  it { should be_installed }
end

def sshd
  case os[:family]
  when /(debian|solaris|ubuntu)/
    'ssh'
  else
    'sshd'
  end
end

describe service(sshd) do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/ssh/sshd_config'), unless: os[:family] == 'solaris' do
  its(:content) { should match /UseDNS no/ }
end
