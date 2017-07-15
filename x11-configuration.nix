# X11 configuration

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system
  services.xserver = {
    # Set video drivers to commercial (unfree) nvidia drivers
    # Requires "nixpkgs.config.allowUnfree = true;"
    videoDrivers = [
      "ati"
    ];

    #enable = true;
    layout = "de";
    xkbModel = "pc105";
    xkbVariant = "nodeadkeys";
    xkbOptions = "eurosing:e";
    libinput.enable = true; # libinput should perform better then synaptics
 
    modules = with pkgs; [
      freetype
    ];

    # set and configure displayManager
    displayManager = {
      slim = {
        enable = true;
        theme = pkgs.fetchurl {
          url = "https://github.com/shokinn/minimalistic-stratum0-theme-for-slim/archive/v1.1.tar.gz";
          sha256 = "9d86370d96505827716bb666ba0f964fa40a0245db70af55c6a0bcce150822e2";
        };
      };
    };
 
    # Use enlightment as desktopManager 
    desktopManager = {
      plasma5.enable = true;
      xterm.enable = false;
    };
  };

  # Set DisplayResolution
  #virtualScreen = {
  #  x = 1280;
  #  y = 800;
  #};

  #resolutions = [{
  #  x = 1280;
  #  y = 800;
  #}];

  # Enable 32Bit acceleration support
  hardware.opengl.driSupport32Bit = true;
}
