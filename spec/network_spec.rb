require 'spec_helper'

def interface_name(index)
  if %w(freebsd openbsd).include?(os[:family])
    "em#{index}"
  else
    "eth#{index}"
  end
end

8.times do |i|
  describe interface(interface_name(i)) do
    it { should exist }
    it { should be_up }
  end
end

describe default_gateway do
  its(:interface) { should eq interface_name(0) }
end
