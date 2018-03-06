# Optimized for Vagrant 1.7 and above.
Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|

  config.vm.box = "bento/ubuntu-16.04"
  #config.vm.box = "xenji/ubuntu-17.04-server"
  #config.vm.box = "wholebits/ubuntu17.04-64"

  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  config.ssh.insert_key = false
  config.ssh.keep_alive = true


  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.verbose = "vv"
    ansible.playbook = "playbooks/vagrant.yml"
    ansible.install_mode = "pip"
  	ansible.version = "2.2.3.0"
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.50.4"
end
