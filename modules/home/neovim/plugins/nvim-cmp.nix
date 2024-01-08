{
  programs.nixvim.plugins = {
    nvim-cmp = {
      enable = true;
      mappingPresets = [ "insert" ];
      autoEnableSources = true;
    };

    cmp_luasnip.enable = true;

    # Buffer
    cmp-buffer.enable = true;

    # Nvim LSP
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lsp-document-symbol.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;

    cmp-path.enable = true;

    cmp-git.enable = true;
    
    cmp-cmdline.enable = true;

    # Fuzzy Finding
    cmp-fuzzy-buffer.enable = true;
    cmp-fuzzy-path.enable = true;
    cmp-rg.enable = true;

    cmp-emoji.enable = true;

  };
  
}
