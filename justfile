push:
    git add .
    git commit -m $(uuidgen)
    git push

ssh-copy-id:
    ssh-copy-id root@nixos

corvus-switch:
    nix run nixpkgs#nixos-rebuild -- switch --flake .#corvus \
        --target-host p47hf1nd3r@corvus \
        --sudo