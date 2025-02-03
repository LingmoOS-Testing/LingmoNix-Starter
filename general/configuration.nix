# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "LingmoOS"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.deepin.enable = true;

  

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lingmo = {
    description = "LingmoOS";
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      mpv
      libreoffice
      chromium
      spotify
      steam
      discord
      element
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    gh
    fastfetch
    # flatpak
  ];

  fonts.packages = with pkgs; [
    fira-code
    jetbrains-mono
    texlivePackages.opensans
    inter-nerdfont
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.victor-mono
    nerd-fonts.noto
    nerd-fonts.lilex
    nerd-fonts.liberation
  ];

  nix.extraOptions = ''
  extra-experimental-features = nix-command flakes
  '';
  nixpkgs.config.allowUnfree = true;

  # Don't edit these contents below!
  environment.etc."issue".text = ''
  <<< Welcome to LingmoNix 2 "Yaksha"! >>>
  A experimental project, Lingmo Software
    
  (C) 2025 Lingmo Software / LingmoNix Yaksha Project
  Licensed under GPL-3.0 LICENSE
  Nixpkgs licensed under MIT LICENSE
  LingmoNix Chinese Edition with Deepin Flavour

  To get installation guide, please visit https://github.com/LingmoOS-Testing/LingmoNix/wiki#installation_guide
  LingmoOS Website: www.lingmo.org

  "Yes, my liege :)." --Von Lycaon
  ENJOY YOUR SYSTEM!
'';
 
  environment.etc."os-release".text = ''
  ANSI_COLOR="1;34"
  BUG_REPORT_URL="https://github.com/NixOS/nixpkgs/issues"
  BUILD_ID="2"
  DOCUMENTATION_URL="https://nixos.org/learn.html"
  HOME_URL="https://lingmo.org/"
  ID=lingmoos
  IMAGE_ID=""
  IMAGE_VERSION=""
  LOGO="nix-snowflake"
  NAME=LingmoNix
  PRETTY_NAME="LingmoNix 2 (Yaksha)"
  SUPPORT_URL="https://nixos.org/community.html"
  VARIANT_ID=
  VERSION="2 (Yaksha)"
  VERSION_CODENAME=yaksha
  VERSION_ID="2"
'';

  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

