{ config, pkgs, ... }:

{
  services.beszel = {
    hub = {
      enable = true;
      host = "0.0.0.0";
      port = 8090;
    };
  };
}