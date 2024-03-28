{...}:
{
  nix.optimise = {
    automatic = true;
    dates = ["Fri 21:00:00"];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
