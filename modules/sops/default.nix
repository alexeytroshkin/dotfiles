{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ./secrets/.env;
    sshKeyPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
    ];
    secrets = {
      wifi_ssid = { };
      wifi_psk = { };
      p47hf1nd3r_pswd = {
        neededForUsers = true;
      };
    };
    templates = {
      "wireless.conf" = {
        content = ''
          network={
            ssid="${config.sops.placeholder.wifi_ssid}"
            psk="${config.sops.placeholder.wifi_psk}"
          }
        '';
        owner = "root";
      };
    };
  };
}
