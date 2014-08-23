require 'spec_helper'

describe command('date +%Z') do
  its(:stdout) { should match /UTC/ }
end
