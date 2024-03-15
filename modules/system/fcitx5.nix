{pkgs, ...}: {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-configtool
      kdePackages.fcitx5-qt
      libsForQt5.fcitx5-qt
    ];
  };
}
