require 'spec_helper'

def interface_name(index)
  if qemu?
    if os[:family] == 'freebsd'
      "vtnet#{index}"
    elsif os[:family] == 'openbsd'
      "vio#{index}"
    else
      "eth#{index}"
    end
  elsif %w(freebsd openbsd).include?(os[:family])
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
