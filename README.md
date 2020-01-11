# control-repo
Puppet control repo

used in 
* https://www.linkedin.com/learning/learning-puppet
* https://www.linkedin.com/learning/puppet-essential-training

# Setup master

sudo yum install -y https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
sudo yum install -y puppetserver vim git pdk
sudo sed -i 's/Xmx2g/Xmx512m/g' /etc/default/puppetserver
sudo echo "[agent]" >> /etc/puppetlabs/puppet/puppet.conf 
sudo echo "server = master.puppet.vm" >> /etc/puppetlabs/puppet/puppet.conf 
sudo systemctl enable puppetserver
sudo systemctl start puppetserver
