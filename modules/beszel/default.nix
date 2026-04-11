{ config, pkgs, ... }:

{
  services.beszel = {
    hub = {
      enable = true;
    };
  };
}