{ pkgs ? import <nixpkgs> {} }:
let
  drv = pkgs.haskell.packages.ghc843.callCabal2nix "quoteService" ./. {};
in
  if pkgs.lib.inNixShell then drv.env else drv

