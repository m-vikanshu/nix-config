{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Fast Bootloader Configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Safe to blacklist since you don't want virtualization
  boot.blacklistedKernelModules = [ "kvm" "kvm_intel" "i2c_hid_acpi" "i2c_hid" ];

  boot.loader.timeout = 1;
  boot.initrd.compressor = "gzip";
  boot.initrd.kernelModules = [ "i915" ];
  boot.kernelParams = [ "quiet" "splash" "loglevel=3" "rd.systemd.show_status=false" "udev.children-max=4" ];

  systemd.settings.Manager = {
    DefaultReadAheadMode = "all";
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Localization
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN"; LC_IDENTIFICATION = "en_IN"; LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN"; LC_NAME = "en_IN"; LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN"; LC_TELEPHONE = "en_IN"; LC_TIME = "en_IN";
  };

  # Display & Desktop Graphics
  services.xserver.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings.bigclock = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Audio & Printing Setup
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Journal Optimization & Speedups
  services.journald.extraConfig = ''
    SystemMaxUse=50M
    SystemMaxFileSize=10M
  '';
  systemd.network.wait-online.enable = false;
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];

  # User Configuration
  users.users.vikanshu = {
    isNormalUser = true;
    description = "vikanshu";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono fira cozette terminus_font proggyfonts font-awesome nerd-fonts.fira-code
  ];

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    # Dev languages
    clang gcc clang-tools lua stylua lua-language-server love

    # Terminal Tools
    unzip ripgrep wget git tmux fzf tree figlet yt-dlp ffmpeg playerctl microfetch jq grim slurp libnotify kbd mpd moc direnv

    # Applications
    brave google-chrome obsidian kitty gimp zathura vlc obs-studio calibre zotero yazi thunar libresprite

    # Graphical Desktop utilities
    networkmanagerapplet brightnessctl blueman pavucontrol nwg-look

    # Hyprland Ecosystem
    bibata-cursors waybar rofi awww dunst hyprshot hyprlock wl-clipboard wireplumber cliphist
    xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xwayland meson
  ];

  # Hyprland Environment Config
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.dbus.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
