{
  pkgs,
  config,
  ...
}: 
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    defaultEditor = true;
    package = pkgs.neovim-nightly;
  };


  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/config/nvim";
    recursive = true;
  };

  # Add Lsp servers, formatters, linters here
  programs.neovim.extraPackages = with pkgs; [
    shfmt
    ripgrep
    wl-clipboard
    xclip
    unzip

    # Used for treesitter
    gcc

    # Lua
    lua-language-server
    stylua
    selene
    config.nur.repos.eggflaw.luau-lsp

    # Python
    python311Packages.python-lsp-server

    # Javascript
    prettierd

    # Rust
    rust-analyzer
    rustfmt

    # nix
    nil
    alejandra
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
