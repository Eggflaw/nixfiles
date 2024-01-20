{ pkgs, inputs, outputs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim" = {
    source = "${pkgs.nvchad}";
    recursive = true;
  };
 
  home.packages = with pkgs; [
    nvchad
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
