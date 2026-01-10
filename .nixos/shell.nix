{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nixd
    nixpkgs-fmt
  ];
}

