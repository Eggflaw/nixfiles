{pkgs, ...}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    ibus.engines = with pkgs.ibus-engines; [ mozc ];    
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      kdePackages.fcitx5-configtool
    ];
  };
}
