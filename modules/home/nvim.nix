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
    shfmt
    ripgrep
    wl-clipboard
    xclip 
    
    # Used for treesitter
    gcc
    
    # Lua
    lua-language-server
    stylua 
    selene

    # Python 
    python311Packages.python-lsp-server

    # Javascript
    prettierd

    # Rust
    rust-analyzer

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
