CPUS="2"
MEMORY="2048"

PUPPETLABS_RPM_SETUP = <<-EOF
sudo yum install -y https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum install -y epel-release
sudo yum install -y puppetserver vim git jq
sudo sed -i 's/Xmx2g/Xmx512m/g' /etc/sysconfig/puppetserver
sudo echo "[agent]" >> /etc/puppetlabs/puppet/puppet.conf 
sudo echo "server = master.puppet.vm" >> /etc/puppetlabs/puppet/puppet.conf 
sudo systemctl enable puppetserver
sudo systemctl start puppetserver
sudo mkdir /etc/puppetlabs/r10k
sudo /opt/puppetlabs/puppet/bin/gem install r10k
EOF


Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.hostname = "master.puppet.vm"

  config.vm.provider "virtualbox" do |v|
    v.name = "master.puppet.vm"
    v.memory = MEMORY
    v.cpus = CPUS
  end

  config.vm.provision "shell", inline: PUPPETLABS_RPM_SETUP

end
