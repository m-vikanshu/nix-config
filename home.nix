{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vikanshu";
  home.homeDirectory = "/home/vikanshu";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.pointerCursor = {
    gtk.enable = true;
    #x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
  };

  xdg.enable = true;
  xdg.configFile = {
    "dunst".source = ./dotfiles/dunst;
    "hypr".source = ./dotfiles/hypr;
    "kitty".source = ./dotfiles/kitty;
    "rofi".source = ./dotfiles/rofi;
    "waybar".source = ./dotfiles/waybar;
    "yazi".source = ./dotfiles/yazi;
    "tmux".source = ./dotfiles/tmux;
    "nvim".source = ./dotfiles/nvim;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      name = "jetbrains-mono";
      size = 11;
    };
  };


  home.sessionVariables = {
    EDITOR = "neovim";
  };

  programs.home-manager.enable = true;
}
