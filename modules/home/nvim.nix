{ pkgs, config, ...}:

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

  programs.neovim.extraPackages = with pkgs; [
    lua-language-server
    stylua
    shfmt

    ripgrep
    wl-clipboard
    xclip 
    
    gcc

    # Python 
    python311Packages.python-lsp-server

    # nix 
    nil 
  ];

  home.packages = with pkgs; [
   (writeShellScriptBin "clean-nvim" ''
      rm -rf ${config.xdg.dataHome}/nvim
      rm -rf ${config.xdg.stateHome}/nvim
      rm -rf ${config.xdg.cacheHome}/nvim
    '') 
   (writeShellScriptBin "clean-nvim-full" ''
      rm -rf ${config.xdg.dataHome}/nvim
      rm -rf ${config.xdg.stateHome}/nvim
      rm -rf ${config.xdg.cacheHome}/nvim
      rm -rf ${config.xdg.configHome}/nvim
   '')
  ];

  
}
