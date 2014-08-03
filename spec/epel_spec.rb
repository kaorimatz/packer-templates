require 'spec_helper'

describe yumrepo('epel'), if: os[:family] == 'redhat' do
  it { should exist }
  it { should_not be_enabled }
end
