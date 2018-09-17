{ pkgs ? import ./nixpkgs.pinned.nix }:
let
  drv = pkgs.haskell.packages.ghc843.callCabal2nix "quoteService" ./. {};
in
  if pkgs.lib.inNixShell then drv.env else drv

