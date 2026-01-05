{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    
    # Using nightly via overlay
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    
    extraLuaConfig = ''
      -- Main config
      ${builtins.readFile ./nvim/init.lua}
      
      -- Additional config files
      ${builtins.readFile ./nvim/theme.lua}
      ${builtins.readFile ./nvim/mini.lua}
      ${builtins.readFile ./nvim/keymaps.lua}
    '';
  };
}
