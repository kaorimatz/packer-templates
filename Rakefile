require 'json'
require 'net/http'
require 'pathname'
require 'rainbow'
require 'rspec/core/rake_task'
require 'uri'

VAGRANT_PROVIDERS = {
  virtualbox: {
    builder_type: 'virtualbox-iso'
  },
  vmware_desktop: {
    builder_type: 'vmware-iso'
  }
}.freeze

task default: ['packer:validate', 'packer:check_iso_url']

namespace :packer do
  desc 'Validate all the packer templates'
  task :validate do
    Pathname.glob('*.json').sort.each do |template|
      puts Rainbow("Validating #{template}...").green
      unless system "packer validate #{template}"
        puts Rainbow("#{template} is not a valid packer template").red
        raise "#{template} is not a valid packer template"
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
        request_head(iso_url) do |response|
          unless available?(response)
            puts Rainbow("#{iso_url} is not available: #{response.message}").red
            raise "#{iso_url} is not available"
          end
        end
      end
    end
  end

  desc 'Push the packer template to Atlas'
  task :push, [:template, :slug, :version, :provider] do |_t, args|
    template = Pathname.new(args[:template])
    slug = args[:slug]
    version = args[:version]
    provider = args[:provider]

    json = JSON.parse(template.read)

    builders = json['builders']
    builders.select! do |builder|
      builder['type'] == VAGRANT_PROVIDERS[provider.to_sym][:builder_type]
    end

    post_processors = json['post-processors']
    post_processors << atlas_post_processor_config(slug, version, provider)
    json['post-processors'] = [post_processors]

    json['push'] = push_config(slug)

    file = Tempfile.open('packer-templates') do |f|
      f.tap do |f|
        JSON.dump(json, f)
      end
    end

    unless system("packer push -var-file=vars/release.json '#{file.path}'")
      puts Rainbow("Failed to push #{template} to Atlas").red
      raise "Failed to push #{template} to Atlas"
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
      task.pattern = 'spec/*_spec.rb'
    end
  end
end

def request_head(uri, &block)
  uri = URI(uri)
  Net::HTTP.start(uri.host, uri.port) do |http|
    http.request_head(uri, &block)
  end
end

def available?(response)
  response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
end

def atlas_post_processor_config(slug, version, provider)
  {
    'type' => 'atlas',
    'artifact' => slug,
    'artifact_type' => 'vagrant.box',
    'metadata' => {
      'version' => version,
      'provider' => provider
    }
  }
end

def push_config(slug)
  {
    'name' => slug,
    'base_dir' => File.dirname(__FILE__),
    'vcs' => true
  }
end
