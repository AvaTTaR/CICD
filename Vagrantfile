$script = <<-SCRIPT
sudo apt-get update -y
sudo apt-get upgrade -y
SCRIPT
Vagrant.configure("2") do |config|
 config.vm.define "K8Smaster" do |k8m|
	k8m.vm.box = "generic/ubuntu2004"
	k8m.vm.hostname = "K8Smaster"
	k8m.vm.network "private_network", ip: "10.100.101.101"
	k8m.vm.provider "virtualbox" do |vb|
		vb.memory= "4096"
	end
	k8m.vm.provision "shell", inline: $script
	end
 config.vm.define "K8Snode1" do |k8s1|
	k8s1.vm.box = "generic/ubuntu2004"
	k8s1.vm.hostname = "K8Snode1"
	k8s1.vm.network "private_network", ip: "10.100.101.102"
	k8s1.vm.provider "virtualbox" do |vb|
		vb.memory= "4096"
	end
	k8s1.vm.provision "shell", inline: $script
	end
 config.vm.define "K8Snode2" do |k8s2|
	k8s2.vm.box = "generic/ubuntu2004"
	k8s2.vm.hostname = "K8Snode2"
	k8s2.vm.network "private_network", ip: "10.100.101.103"
	k8s2.vm.provider "virtualbox" do |vb|
		vb.memory= "4096"
	end
	k8s2.vm.provision "shell", inline: $script
	end
 config.vm.define "K8Snode3" do |k8s3|
	k8s3.vm.box = "generic/ubuntu2004"
	k8s3.vm.hostname = "K8Snode3"
	k8s3.vm.network "private_network", ip: "10.100.101.104"
	k8s3.vm.provider "virtualbox" do |vb|
		vb.memory= "4096"
	end
	k8s3.vm.provision "shell", inline: $script
	end
 config.vm.define "K8Snode4" do |k8s4|
	k8s4.vm.box = "generic/ubuntu2004"
	k8s4.vm.hostname = "K8Snode4"
	k8s4.vm.network "private_network", ip: "10.100.101.105"
	k8s4.vm.provider "virtualbox" do |vb|
		vb.memory= "4096"
	end
	k8s4.vm.provision "shell", inline: $script
	end
config.vm.define "artifact" do |art|
	art.vm.box = "generic/ubuntu2004"
	art.vm.hostname = "artifact"
	art.vm.network "private_network", ip: "10.100.101.106"
	art.vm.provider "virtualbox" do |vb|
		vb.memory= "4096"
	end
	art.vm.provision "shell", inline: $script
	end
		
end


