require 'rainbow'

task :default => [:validate]

desc 'Validate all the packer templates'
task :validate do
  Dir.glob('*.json').each do |template|
    puts Rainbow("packer validate #{template}").green
    unless system "packer validate #{template}"
      puts Rainbow("#{template} is not a valid packer template").red
      fail "#{template} is not a valid packer template"
    end
  end
end
