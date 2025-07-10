{ config, pkgs, lib, ... }:
{

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

#  users.users.root.initialPassword = "password";
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDm6jfav0cPBC1nhEkq2lV74xBuwHw70qRFG0uPYZA7O"
  ];

  # Autologin on console
  services.getty.autologin.enable = true;
  services.getty.autologin.user = "root";

  # Basic environment
  environment.systemPackages = with pkgs; [ nano ];
  systemd.extraConfig = ''
    DefaultTimeoutStartSec=900s
  '';
 
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
 
  system.stateVersion = "24.11";
}
