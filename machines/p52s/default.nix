# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, lib, config, pkgs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-ssd
    ../../common
    ./hardware-configuration.nix
  ];

  # Define networking hostname
  networking.hostName = "nixos-p52s";

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      transformationMatrix = "1.5 0 0 0 1.5 0 0 0 1";
      tappingButtonMap = "lrm";
      scrollMethod = "twofinger";
    };
  };

  environment.shellAliases = {
    # Create an alias for nixos-rebuild
    nor = ''
    sudo nixos-rebuild switch --flake ~/nixos-config/#p52s && ls /nix/var/nix/profiles/ | tail -n 2 | awk {'print "/nix/var/nix/profiles/" $0'} | xargs nvd diff
    '';
  };

  # Set default shell to fish
  users.defaultUserShell = pkgs.fish;
    
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
