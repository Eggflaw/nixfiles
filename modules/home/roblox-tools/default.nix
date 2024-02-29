{pkgs, ...}: {
  home.packages = with pkgs; [
    rojo
    lune
    wally
  ];
}
