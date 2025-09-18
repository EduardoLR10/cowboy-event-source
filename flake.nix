{
  description = "CES";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
  with builtins;
  flake-utils.lib.eachDefaultSystem (
    system:
    let pkgs = import nixpkgs {inherit system;};
    in {
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        rebar3
        erlang
      ];
    };
  });
}
