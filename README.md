# Fujitsu Siemens ESPRIMO Mobile V6545

NixOS system configuration for a [Stratum 0](https://stratum0.org/) Fujitsu Siemens ESPRIMO Mobile V6545 'Frickelraum' Notebook.

## Disks

You'll want to use ~gdisk~ on `/dev/sda`, I found this via ~lsblk~.

Create partitions like this:

| Partition | Size                  | Code   | Purpose                  |
|-----------|-----------------------|--------|--------------------------|
|         1 | 1000 KiB              | `EF02` | BIOS boot partition      |
|         2 | 500 MiB               | `8300` | /boot partition          |
|         3 | remaining space       | `8E00` | Linux LVM                |

### LVM setup

```shell
pvcreate /dev/sda3
vgcreate lclhdd /dev/sda3
lvcreate -n swap lclhdd -L 6G # NOTE(!) If the laptop has 4GB of RAM use 8G instead
lvcreate -n root lclhdd -l 100%FREE
```
### Format disk

```shell
mkfs.vfat -n BOOT /dev/sda2
mkfs.ext4 -L root /dev/lclhdd/root
mkswap -L swap /dev/lclhdd/swap
```

### Mount partitions

```shell
mount /dev/lclhdd/root /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot
```

#### Acticate swap

```shell
swapon /dev/vg/swap
```

## Initial Configuration

Run `nixos-generate-config --root /mnt`

### Create a `wifi-network-configuration.nix` configuration (Optional, only if you want to use wifi)

If you want to use Wifi you have to create an "wifi-network-configuration.nix" file. This is an example

```nix
# Wifi networks configuratoin

{ config, ... }:

{
  # Add wifi networks to wpa_supplicant
  networking.wireless.networks = {
    # SSID of the network
    # German Free Wifi in ICE Trains
    WIFIonICE = { };
    # If you want to use a wifi network with pre-shared key use this example
    # PSK example
    Wifi_SSID = {
      psk="yourPskHere";
    };
  };
}
```
