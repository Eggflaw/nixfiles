{
  programs.nixvim.keymaps = [
	{
	  key = "<C-n>";
	  action = "<cmd> NvimTreeToggle <CR>";
	  options.desc = "Toggle nvimtree";
	}
  ];
}

