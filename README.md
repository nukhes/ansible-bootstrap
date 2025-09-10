# void-bootstrap
Setup Void Linux for my use-case using Ansible
```bash
sudo xbps-install -S ansible void-repo-multilib void-repo-nonfre
xbps-install -S
ssh-keygen -t ed25519 -C "79018158+nukhes@users.noreply.github.com"
cat .ssh/id_ed25519.pub
```

After that Ansible Playbook can be executed

```bash
git clone https://github.com/nukhes/bootstrap.git
ansible-playbook -i inventory.ini playbooks/void.yml
```