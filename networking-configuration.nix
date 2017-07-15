# Networking related configutaion
 
{ config, ... }:

{
  networking = {
    # Hostname
    hostName = "s0-nixos";
    # Domain
    domain = "sao.local";
    # Enable the firewall (just to be sure, it's enabled by default)
    firewall.enable = true;
    # Firewall configuration
    # TCP Ports
    # firewall.allowedTCPPorts = [
    #
    # ];
    # UDP Ports
    # firewall.allowedUDPPorts = [
    #
    # ];
    # Enable wireless network
    wireless.enable = true;
    # Add wifi networks to ./wifi-networks-configuratoin.nix
  };
}
