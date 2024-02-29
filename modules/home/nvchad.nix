{...}: {
  programs.NvChad = {
    enable = true;
    defaultEditor = true;
    customConfig = ../../config/nvim;
  };
}
