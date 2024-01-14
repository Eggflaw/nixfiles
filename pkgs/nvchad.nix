{ lib, stdenv, pkgs }:

let 
  config = ../config/nvim;
in
stdenv.mkDerivation {
  pname = "nvchad";
  version = "2.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "c80f3f0501800d02b0085ecc1f79bfc64327d01e";
    sha256 = "sha256-+yjMIzWs7h217SxmTocpkC06Y3vEcDvVyMuhtaQGeF0=";  
  };

  installPhase = ''
    mkdir $out
    cp -r * "$out/"
    mkdir -p "$out/lua/custom"
    cp -r ${config}/* "$out/lua/custom/"
  '';

  meta = with lib; {
    description = "NvChad";
    homepage = "https://github.com/NvChad/NvChad";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
