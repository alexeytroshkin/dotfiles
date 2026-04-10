push:
    git add .
    git commit -m $(uuidgen)
    git push

corvus-ssh-copy-id:
    ssh-copy-id -i ~/.ssh/corvus-p47hf1nd3r.pub root@nixos

corvus-switch:
    nix run nixpkgs#nixos-rebuild -- switch --flake .#corvus \
        --target-host root@nixos \
        --build-host localhost \
        --sudo