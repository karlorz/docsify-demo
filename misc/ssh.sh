ssh-keygen -t rsa

ssh-copy-id -i $HOME/.ssh/id_rsa.pub root@10.10.2.1

# test
echo "foo" > /tmp/foo.txt && scp /tmp/foo.txt root@10.10.2.1:/tmp/

# add user
sudo adduser ansible

# user@ubuntu-server:~$ groups user
# user : user adm cdrom sudo dip plugdev lxd

sudo usermod -aG adm,cdrom,sudo,dip,plugdev,lxd ansible 

ssh-keygen -t ed25519 -f ~/.ssh/ansible-key

cat ~/.ssh/ansible-key.pub

ansible@ubuntu-server:~$ cat ~/.ssh/ansible-key.pub
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID50Z6CNqPpVa9t+KQ27KGIaDbiHWlbTj+f68TOnTm13 ansible@ubuntu-server

paste pub key to pve_onboard.yml

mkdir files

echo "ansible ALL=(ALL) NOPASSWD: ALL" > files/sudoer_ansible

ansible-playbook pve_onboard.yml -i inventory --user=root -k