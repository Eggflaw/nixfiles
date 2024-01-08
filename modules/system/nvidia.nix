{ config, lib, pkgs, ...}:
{
 # Enable OpenGL
 hardware.opengl = {
   enable = true;
   driSupport = true;
   driSupport32Bit = true;
   };
 
 # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    open = false;

    # Eanble PRIME
    prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };



    # Modesetting is required.
    modesetting.enable = true;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;
    
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
