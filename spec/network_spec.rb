require 'spec_helper'

if %w(freebsd openbsd).include?(os[:family])
  interface0 = 'em0'
  interface1 = 'em1'
else
  interface0 = 'eth0'
  interface1 = 'eth1'
end

describe interface(interface0) do
  it { should have_ipv4_address('10.0.2.15') }
end

describe interface(interface1) do
  it { should have_ipv4_address('192.168.0.100') }
end

describe default_gateway do
  its(:ipaddress) { should eq '10.0.2.2' }
  its(:interface) { should eq interface0 }
end
