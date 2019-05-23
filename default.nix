{ pkgs ? import ./nixpkgs.pinned.nix
}:
let
  hsPkgs = pkgs.haskell.packages.ghc865;
  drv = hsPkgs.callCabal2nix "servantExample" ./. {};
in
  if pkgs.lib.inNixShell then drv.env else drv

