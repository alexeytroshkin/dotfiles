push:
    git add .
    git commit -m $(uuidgen)
    git push

ssh-copy-id:
    ssh-copy-id root@nixos

switch host:
    nix run nixpkgs#nixos-rebuild -- switch --flake .#{{host}} \
        --target-host p47hf1nd3r@{{host}} \
        --sudo \
        --ask-sudo-password