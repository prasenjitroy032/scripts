#!/bin/bash

# Download and run
# curl https://gist.githubusercontent.com/realtebo/3451070eba5a55186afb686d1690abd2/raw/install_ansible.sh?_=$(date +%s) | bash

sudo apt-get update && sudo apt-get install software-properties-common -y
sudo apt-add-repository universe -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update && sudo apt-get install ansible python-pip -y
pip install "pywinrm>=0.3.0" 
pip install cryptography

if [ z $(grep "windows:vars" "/etc/ansible/hosts") ]; then

  echo "Configuro gli host";
  
  sudo cat >> "/etc/ansible/hosts" <<HEREDOC

[local]
localhost     ansible_connection=local

[windows:vars]
ansible_winrm_scheme=http
ansible_connection=winrm

HEREDOC
 
fi;
