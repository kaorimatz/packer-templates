require 'spec_helper'

describe yumrepo('epel') do
  it { should exist }
  it { should_not be_enabled }
end
