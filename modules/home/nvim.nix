{ pkgs, inputs, outputs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  xdg.configFile."nvim".source = "${pkgs.nvchad}";
 
  home.packages = with pkgs; [
    nvchad
  ];

  programs.neovim.extraPackages = with pkgs; [
    gcc
    nodejs_20
    ripgrep
    wl-clipboard
    xclip
  ];
}
