{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    # Using nightly via overlay
    # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    plugins = with pkgs.vimPlugins;
    [
      nvim-treesitter
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.cmake
      nvim-treesitter-parsers.c_sharp
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.nix
      nvim-treesitter-textobjects
      telescope-nvim
      blink-cmp
      yazi-nvim
      nvim-lspconfig
      conform-nvim
      mini-nvim
      flash-nvim
      which-key-nvim
      vim-suda
      cyberdream-nvim
      lazydev-nvim
      vim-tmux-navigator
      lualine-nvim
      copilot-vim
    ];

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
