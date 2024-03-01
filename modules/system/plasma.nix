{pkgs, ...}: {
  environment.systemPackages = with pkgs; [sddm-chili-theme];

  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "breeze";
    wayland.enable = true;
  };

  services.xserver.desktopManager.plasma6 = {
    enable = true;
  };
}
