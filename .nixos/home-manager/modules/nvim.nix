{ inputs, pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    # Using nightly via overlay
    # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    plugins = with pkgs.vimPlugins; [
      oil-nvim
      plenary-nvim
      gruvbox-nvim
      auto-session
      nvim-ts-autotag
      nvim-treesitter
      nvim-treesitter-parsers.glsl
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.gdscript
      nvim-treesitter-parsers.c_sharp
      nvim-treesitter-parsers.typescript
      nvim-treesitter-parsers.javascript
      nvim-treesitter-parsers.json
      nvim-treesitter-parsers.html
      nvim-treesitter-parsers.bash
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.toml
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.typst
      nvim-treesitter-parsers.css
      nvim-treesitter-textobjects
      vim-tmux-navigator
      typst-preview-nvim
      telescope-nvim
      blink-cmp
      nvim-lspconfig
      conform-nvim
      mini-nvim
      flash-nvim
      which-key-nvim
      cyberdream-nvim
      lazydev-nvim
      lualine-nvim
      nvim-colorizer-lua
      fidget-nvim
      copilot-vim
    ];

    initLua = ''
      -- Main config
      ${builtins.readFile ./nvim/init.lua}

      -- Additional config files
      ${builtins.readFile ./nvim/keymap.lua}
      ${builtins.readFile ./nvim/plugins/lsp.lua}
      ${builtins.readFile ./nvim/plugins/treesitter.lua}
      ${builtins.readFile ./nvim/plugins/telescope.lua}
      ${builtins.readFile ./nvim/plugins/misc.lua}
      ${builtins.readFile ./nvim/style/theme.lua}
      ${builtins.readFile ./nvim/style/lualine.lua}
    '';
  };
}
