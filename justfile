push:
    git add .
    git commit -m $(uuidgen)
    git push

sops:
    EDITOR="code --wait" nix run nixpkgs#sops -- ./modules/sops/secrets/.env

switch host:
    nix run nixpkgs#nixos-rebuild -- switch --flake .#{{host}} \
        --target-host p47hf1nd3r@{{host}} \
        --sudo \
        --ask-sudo-password