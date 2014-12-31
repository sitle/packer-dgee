require 'rake'
require 'fileutils'

namespace :prod do
  desc 'Build the base system'
  task :build do
    environnement = 'prod'
    role = ENV['role']
    system "packer build -var-file=roles/default.json -var-file=roles/#{role}.json templates/centos6-vmware.json"
    system "ovftool output-vmware-iso/packer-vmware-iso.vmx #{role}.ova"
    FileUtils.rm_rf('output-vmware-iso/')
    end
end
