require 'pathname'
require 'rainbow'
require 'rspec/core/rake_task'

task :default => ['packer:validate']

namespace :packer do
  desc 'Validate all the packer templates'
  task :validate do
    Pathname.glob('*.json').sort.each do |template|
      puts Rainbow("packer validate #{template}").green
      unless system "packer validate #{template}"
        puts Rainbow("#{template} is not a valid packer template").red
        fail "#{template} is not a valid packer template"
      end
    end
  end
end

namespace :spec do
  Pathname.glob('*.json').sort.each do |template|
    name = template.basename('.json').to_s
    host = name.gsub(/[.]/, '_')
    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(host) do |task|
      ENV['HOST'] = host
      task.pattern = "spec/#{host}/*_spec.rb"
    end
  end
end
