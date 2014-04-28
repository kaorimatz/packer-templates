require 'net/ssh'
require 'serverspec'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

RSpec.configure do |config|
  options = {}
  host = ''
  user = ''
  ssh_config = `vagrant ssh-config #{ENV['HOST']}`
  ssh_config.each_line do |line|
    if match = /HostName (.*)/.match(line)
      host = match[1]
    elsif match = /User (.*)/.match(line)
      user = match[1]
    elsif match = /IdentityFile (.*)/.match(line)
      options[:keys] = [match[1].gsub(/"/, '')]
    elsif match = /Port (.*)/.match(line)
      options[:port] = match[1]
    end
  end
  config.ssh = Net::SSH.start(host, user, options)
end
