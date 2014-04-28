require 'spec_helper'

describe package('openssh-server') do
  it { should be_installed }
end

describe service('sshd') do
  it { should be_enabled }
  it { should be_running }
end
