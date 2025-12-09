Vagrant.configure("2") do |config|

  # SISTEMA OPERATIVO DE LA VM
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20240821.0.1"

  # CONFIGURACION DE LA VM
  config.vm.hostname = "Pablis"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.provider "virtualbox" do |vb|
    vb.name = "DockerTest"
    vb.memory = "4096"
    vb.cpus = 2
    vb.gui = true
  end

  # CONFIGURACION SHELL
  config.vm.provision "shell", path: "bootstrap.sh"
end