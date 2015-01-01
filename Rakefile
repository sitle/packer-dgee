require 'rake'
require 'fileutils'

namespace :prod do
  desc "Pour construire l'image."
  task :build do
    role = ENV['role']

    # Le nom de l'image généré correspond au nom du role
    image = role

    # si le role n'est pas explicite, c'est qu'on en a pas besoin
    # on ne génère donc pas l'argument permettant d'appeler le json
    # de parametre
    if role.nil?
      role = ''
    else
      role = "-var-file=roles/#{role}.json"
    end

    system "packer build -var-file=roles/default.json #{role} templates/centos6-vmware.json"

    system "ovftool output-vmware-iso/centos-6.vmx #{image}.ova"
    FileUtils.rm_rf('output-vmware-iso/')
  end
end
