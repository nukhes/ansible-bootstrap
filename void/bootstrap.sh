#!/usr/bin/env bash
set -euo pipefail

EMAIL="79018158+nukhes@users.noreply.github.com"
REPO="https://github.com/nukhes/ansible-bootstrap.git"
WORKDIR="$HOME/ansible-bootstrap/void"

echo "[*] Installing base packages (ansible + multilib and nonfree repos)..."
sudo xbps-install -Sy ansible void-repo-multilib void-repo-nonfree

echo "[*] Updating system..."
sudo xbps-install -Su

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo "[*] Generating SSH key..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/id_ed25519" -N ""
  echo "[*] Your public key is:"
  cat "$HOME/.ssh/id_ed25519.pub"
  echo ">>> Add this key to your GitHub account (Settings → SSH and GPG keys)."
fi

if [ ! -d "$WORKDIR" ]; then
  echo "[*] Cloning repository $REPO..."
  git clone "$REPO" "$HOME/ansible-bootstrap"
fi

cd "$WORKDIR"

echo "[*] Running playbook..."
ansible-playbook -i inventory.ini void.yml
