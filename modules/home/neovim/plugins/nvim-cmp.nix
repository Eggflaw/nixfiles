{
  programs.nixvim.plugins = {
    nvim-cmp = {
      enable = true;
      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              -- [[ elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif check_backspace() then
                fallback()
              else
                fallback() ]]
              end
            end
          '';
          modes = [
            "i"
            "s"
          ];
        };
        
      };

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
