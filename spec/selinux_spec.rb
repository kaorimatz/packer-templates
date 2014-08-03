require 'spec_helper'

describe selinux, if: os[:family] == 'fedora' || os[:family] == 'redhat' do
  it { should be_enforcing }
end
