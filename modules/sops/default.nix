{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    gnupg.sshKeyPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
    ];
    secrets = {
      wifi_psk = { };
      p47hf1nd3r_pswd = {
        neededForUsers = true;
      };
    };
    templates = {
      "wireless_secrets" = {
        content = ''
          DOM_RU_OUlA_5G=${config.sops.placeholder.wifi_psk}
        '';
        owner = "root";
      };
    };
  };
}
