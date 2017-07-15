# Packages to install

{ config, pkgs, ... }:

# Local custom package repo
let custompkgs = import ./custom-pkgs/default.nix {}; in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # TODO may group by functoin?
  environment.systemPackages = [
    pkgs.alsaUtils
    pkgs.curl
    pkgs.exfat
    pkgs.firefox
    pkgs.git
    pkgs.glxinfo
    pkgs.gptfdisk
    pkgs.htop
    pkgs.hugo
    pkgs.lynx
    pkgs.mc
    pkgs.mkpasswd
    pkgs.powertop
    pkgs.rxvt_unicode
    pkgs.screen
    pkgs.spotify
    pkgs.sudo
    pkgs.unzip
    pkgs.vim
    pkgs.wget
    pkgs.xfontsel
    pkgs.xlsfonts
    pkgs.xorg.mkfontdir
    pkgs.xorg.xbacklight # Backlight control
    pkgs.xorg.xprop
    pkgs.zsh
  ];
}
