ssh-keygen -t rsa

ssh-copy-id -i $HOME/.ssh/id_rsa.pub root@10.10.2.1

# test
echo "foo" > /tmp/foo.txt && scp /tmp/foo.txt root@10.10.2.1:/tmp/