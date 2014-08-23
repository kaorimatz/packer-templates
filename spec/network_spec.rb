require 'spec_helper'

describe interface('eth0') do
  it { should have_ipv4_address('10.0.2.15') }
end

describe interface('eth1') do
  it { should have_ipv4_address('192.168.0.100') }
end

describe default_gateway do
  its(:ipaddress) { should eq '10.0.2.2' }
  its(:interface) { should eq 'eth0' }
end
