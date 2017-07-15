# User Configuration

{ config, pkgs, ... }:

{
  # General Users configuration
  users = {
    # Define Standard User Shell
    defaultUserShell = pkgs.bash;
    # Set motd
    motd = "Remember, remember the 5th of November.";
    # Define a user account. Don't forget to set a password with ‘passwd’.
    extraUsers.stratum0 = {
      isNormalUser = true;
      description = "Stratum 0";
      home = "/home/stratum0";
      uid = 1000;
      group = "users";
      extraGroups = [
        "adm"
        "audio"
        "cdrom"
        "dialout"
        "disk"
        "systemd-journal"
        "tty"
        "video"
        "wheel"
      ];
      initialPassword = "stratum0";
      useDefaultShell = true;
    };
  };
}
