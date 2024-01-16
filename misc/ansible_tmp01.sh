ansible all --list-hosts
sudo mkdir /etc/ansible
sudo mv /etc/ansible/hosts /etc/ansible/hosts.20240116
sudo nano /etc/ansible/hosts
echo "[proxmox_lab]" | sudo tee -a /etc/ansible/hosts && echo "10.10.2.1" | sudo tee -a /etc/ansible/hosts

[proxmox_lab]
10.10.2.1

sudo mv /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.20240116
echo -n | sudo tee /etc/ansible/ansible.cfg
echo "[defaults]" | sudo tee -a ~/ansible.cfg && echo "host_key_checking=False" | sudo tee -a ~/ansible.cfg
echo "[defaults]" | sudo tee -a /etc/ansible/ansible.cfg && echo "host_key_checking=False" | sudo tee -a /etc/ansible/ansible.cfg

ansible-config init --disabled > /etc/ansible/ansible.cfg

ansible-config init --disabled | sudo tee /etc/ansible/ansible.cfg > /dev/null

ansible all -m ping -u root

ansible all -m ping -u root -k



When using Ansible for the first time to ping a host, you might need to specify the password for the user. You can use the -k option to prompt for the password interactively. Here's an example:

sh
Copy code
ansible all -m ping -u root -k
After running this command, Ansible will prompt you for the password for the specified user (root in this case).

Alternatively, you can use the -K option to prompt for the sudo password if your user requires elevated privileges:

sh
Copy code
ansible all -m ping -u root -K
Again, this will prompt you for the sudo password interactively. Choose the option that fits your authentication setup.

nano ~/proxmox_update.yml

ansible-playbook -u root ~/proxmox_update.yml
