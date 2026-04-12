{ config, pkgs, ... }:

{
  services = {
    forgejo = {
      enable = true;
      user = "p47hf1nd3r";
    };
  };
}