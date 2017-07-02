require 'spec_helper'

def home_directory
  if os[:family] == 'solaris'
    '/export/home/vagrant'
  else
    '/home/vagrant'
  end
end

def synced_folder_fstype
  return if %w(freebsd openbsd).include?(os[:family])

  if virtualbox?
    'vboxsf'
  elsif vmware?
    if os[:family] == 'centos'
      'vmhgfs'
    elsif os[:family] == 'debian' && os[:release] =~ /^[678]\./
      'vmhgfs'
    elsif os[:family] == 'ubuntu' && os[:release] == '12.04'
      'vmhgfs'
    elsif os[:family] == 'ubuntu' && os[:release] == '14.04'
      'none'
    else
      'fuse.vmhgfs-fuse'
    end
  end
end

describe user('vagrant') do
  it { should exist }
  it { should belong_to_group 'vagrant' }
  it { should have_home_directory home_directory }
end

describe file("#{home_directory}/.ssh") do
  it { should be_directory }
  it { should be_owned_by 'vagrant' }
  it { should be_grouped_into 'vagrant' }
  it { should be_mode 700 }
end

describe file("#{home_directory}/.ssh/authorized_keys") do
  it { should be_file }
  it { should be_owned_by 'vagrant' }
  it { should be_grouped_into 'vagrant' }
  it { should be_mode 600 }
end

describe file('/etc/vagrant_box_build_time') do
  it { should be_file }
end

describe file('/vagrant'), if: synced_folder_fstype do
  it { should be_mounted.with type: synced_folder_fstype }
  it { should be_directory }
  it { should be_owned_by 'vagrant' }
  it { should be_grouped_into 'vagrant' }
end
