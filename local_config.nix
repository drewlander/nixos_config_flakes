{ config, pkgs, ... }:

{
  networking.firewall.enable = true; 
  services.printing.drivers = [ pkgs.hplip pkgs.brlaser ];
  environment.systemPackages = with pkgs; [
  neovim 
  emacs
  ntfs3g
  x264
  ffmpeg_6-full
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-gnome
  cifs-utils
  jdk17
  i2p
  pinentry-gnome3
  evolution
  evolution-ews
  gnomeExtensions.caffeine
  gnomeExtensions.dash-to-dock
  gnomeExtensions.appindicator
  gnomeExtensions.just-perfection

  ];

nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 10d";
};

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.flatpak.enable = true;
    xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
    ];
    };
  security.apparmor.enable = true;
  security.chromiumSuidSandbox.enable = true;
  networking.firewall.allowedTCPPorts = [];
  networking.firewall.allowedUDPPorts = [];
  services.earlyoom.enable = true;
services.udev.packages = [ pkgs.yubikey-personalization ];
services.pcscd.enable = true;

  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.dconf.enable = true;

fonts.fontDir.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.printing.enable = true;

  services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};

}
