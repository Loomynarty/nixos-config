# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Essentials
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    helix
    wget
    curl
    pciutils
    xclip
    nvd
    
    # Applications
    firefox-devedition
    vscodium
    nil
    kate
    qalculate-gtk
    keepassxc
    flameshot
    onedrive
    spotifyd
    syncthing
    libsForQt5.filelight
    hakuneko
  
    # Gaming
    wineWowPackages.unstable
    discord

  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  
  services.hardware.openrgb = { enable = true; };
  programs.fish.enable = true;

}
