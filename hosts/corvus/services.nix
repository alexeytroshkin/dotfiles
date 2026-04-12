{ config, pkgs, ... }:

{
  services = {   
    openssh.enable = true;
    
    beszel = {
      hub = {
        enable = true;
        host = "0.0.0.0";
        port = 8090;
      };
      agent = {
        enable = true;
        environment = {
          KEY = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHOaZwkyoUgXRr+UZg80fODDRuFBdhM3VpXGhhbWtIg+";
        };
      };
    };

    # vaultwarden = {
    #   enable = true;
    # };

    # forgejo = {
    #   enable = true;
    #   user = "p47hf1nd3r";
    # };
  };
}