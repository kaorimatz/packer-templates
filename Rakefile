require 'json'
require 'net/http'
require 'pathname'
require 'rainbow'
require 'rspec/core/rake_task'
require 'uri'

task :default => ['packer:validate', 'packer:check_iso_url']

namespace :packer do
  desc 'Validate all the packer templates'
  task :validate do
    Pathname.glob('*.json').sort.each do |template|
      puts Rainbow("Validating #{template}...").green
      unless system "packer validate #{template}"
        puts Rainbow("#{template} is not a valid packer template").red
        fail "#{template} is not a valid packer template"
      end
    end
  end

  desc 'Check if all the ISO URLs are available'
  task :check_iso_url do
    Pathname.glob('*.json').sort.each do |template|
      json = JSON.parse(template.read)
      mirror = json['variables']['mirror']
      json['builders'].each do |builder|
        iso_url = builder['iso_url'].sub('{{user `mirror`}}', mirror)
        puts Rainbow("Checking if #{iso_url} is available...").green
        response = request_head(iso_url)
        unless response.is_a? Net::HTTPSuccess
          puts Rainbow("#{iso_url} is not available: HEAD #{response.uri} => #{response.message}").red
          fail "#{iso_url} is not available"
        end
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
      task.pattern = "spec/*_spec.rb"
    end
  end
end

def request_head(uri)
  uri = URI(uri)
  response = Net::HTTP.start(uri.host, uri.port) { |http| http.head(uri) }
  case response
  when Net::HTTPSuccess then
    response
  when Net::HTTPRedirection then
    request_head(response['location'])
  else
    response
  end
end
