{
  lib,
  fetchFromGitHub,
  rustPlatform,
  pkg-config,
  openssl,
}:
rustPlatform.buildRustPackage rec {
  pname = "wally";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "UpliftGames";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-hSFrITT2I/cruGciYXCCKBpRrn/udrhVwBjbNeoSQ78=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
    allowBuiltinFetchGit = true;
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ];

  meta = with lib; {
    description = "A modern package manager for Roblox projects";
    homepage = "https://wally.run";
    changelog = "https://github.com/UpliftGames/wally/tree/v${version}/CHANGELOG.md";
    license = licenses.mpl20;
    maintainers = with maintainers; [];
  };
}
