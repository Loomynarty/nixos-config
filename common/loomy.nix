{ pkgs, config, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.loomy = {
    isNormalUser = true;
    description = "loomy";
    extraGroups = [ "networkmanager" "wheel" ];
  };

} 
