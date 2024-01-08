{ pkgs, inputs, ...}:

{
  imports = [ 
   	inputs.nixvim.homeManagerModules.nixvim 
    ./plugins
	  ./keymaps.nix
	];

  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
    rust-analyzer-unwrapped
];

  programs.nixvim = {
    enable = true;  
    vimAlias = true; 

	globals.mapleader = " ";

    options = {
      shiftwidth = 2;
      tabstop = 2;
	    softtabstop = 2;
	    expandtab = true;
	    smartindent = true;

      number = true;
      relativenumber = true;
    };

    clipboard.providers = {
      wl-copy.enable = true;
      xclip.enable = true;
    };

    colorschemes.catppuccin.enable = true;
    plugins = {
      lightline.enable = true;
	    todo-comments.enable = true; 
	    nvim-tree.enable = true;
	    dashboard.enable = true;
	    toggleterm.enable = true;
    };
  };
}
