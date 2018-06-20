let pkgs = import <nixpkgs> {};
    nixpkgsSrc = pkgs.fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs";
      sha256 = "1rqzh475xn43phagrr30lb0fd292c1s8as53irihsnd5wcksnbyd";
      rev = "22bc57c314f0ca7b82825f52cc9e847c08fd3a34";
    };

    nixpkgs = import nixpkgsSrc {}; in

nixpkgs.stdenv.mkDerivation {
  name = "myEnv";
  buildInputs = [ nixpkgs.gcc ];
}


