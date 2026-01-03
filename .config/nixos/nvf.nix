{ pkgs, lib, ... }:
{
  vim = {
    extraLuaFiles = [
      "nvim/init.lua"
    ];
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      rust.enable = true;
    };
  };
}
