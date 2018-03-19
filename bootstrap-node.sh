#!/bin/sh

# Run on VM to bootstrap Puppet Agent nodes

echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Ansible Master" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.32.10   ansible01.example.com  ansible01" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.32.20   ansible02.example.com  ansible02" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.32.40   ansible03.example.com  ansible03" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.32.40   master.example.com  master" | sudo tee --append /etc/hosts 2> /dev/null && \

#sudo apt-get update -yq
#sudo apt-get upgrade -yq
sudo apt-get install ansible -yq
sudo apt-get install sshpass -yq
sudo passwd vagrant <<EOF
vagrant
vagrant

EOF

sudo cat > /home/vagrant/ansible.cfg <<EOF
[defaults]
host_key_checking = False
callback_plugins = plugins

[ssh_connection]
scp_if_ssh=True
EOF
chown vagrant:vagrant /home/vagrant/ansible.cfg

exit 0
