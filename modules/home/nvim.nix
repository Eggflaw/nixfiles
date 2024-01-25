{ pkgs, inputs, outputs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = "${pkgs.vimPlugins.nvchad}";
    recursive = true;
  };

  xdg.configFile."nvim/lua/custom" = {
    source = ../../config/nvim;
    recursive = true;
  };
 
  home.packages = with pkgs; [
    vimPlugins.nvchad
  ];

  programs.neovim.extraPackages = with pkgs; [
    gcc
    nodejs_20
    cargo
    ripgrep
    wl-clipboard
    xclip
  ];
}
