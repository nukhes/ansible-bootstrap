# ansible-bootstrap
Setup Linux for my use-case using Ansible
## Void Linux
```bash
sudo xbps-install -S ansible void-repo-multilib void-repo-nonfree
sudo xbps-install -S
ssh-keygen -t ed25519 -C "79018158+nukhes@users.noreply.github.com"
cat .ssh/id_ed25519.pub
```

After that Ansible Playbook can be executed

```bash
git clone https://github.com/nukhes/ansible-bootstrap.git
cd ./ansible-bootstrap/void
ansible-playbook -i inventory.ini void.yml
```
