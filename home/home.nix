{
  outputs,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.NvChad.homeManagerModules.default
    outputs.homeModules
  ];

  nixpkgs.overlays = [
    outputs.overlays.additions
    outputs.overlays.modifications
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;

  home.username = "eggflaw";
  home.homeDirectory = "/home/eggflaw";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    floorp
    discord
    steam
    spotify
    obs-studio
    neofetch

    lutris
    ventoy-full
    winePackages.unstableFull

    wget
    pciutils
    socat
    gh
    (writeShellScriptBin "update-home" ''
      home-manager switch --flake ~/nixos/#default
    '')
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Programs
  programs.home-manager.enable = true;
}
