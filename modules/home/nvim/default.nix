{ pkgs, inputs, ...}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = "${pkgs.vimPlugins.nvchad}";
  };

  home.packages = with pkgs; [
    vimPlugins.nvchad
  ];
}
