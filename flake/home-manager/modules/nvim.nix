{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      # Treesitter parsers
      nvim-treesitter-parsers.qmljs
      nvim-treesitter-parsers.glsl
      nvim-treesitter-parsers.rust
      nvim-treesitter-parsers.cpp
      nvim-treesitter-parsers.c
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
      nvim-treesitter-parsers.razor
      nvim-treesitter-textobjects
      # Navigation
      plenary-nvim
      telescope-nvim
      oil-nvim
      auto-session
      nvim-ts-autotag
      mini-nvim
      flash-nvim
      # Formatting/LSP
      conform-nvim
      blink-cmp
      nvim-lspconfig
      # Appearance
      gruvbox-material
      lualine-nvim
      fidget-nvim
      which-key-nvim
      # Misc
      minuet-ai-nvim
      typst-preview-nvim
    ];

    initLua = ''
      -- Main config
      ${builtins.readFile ./nvim/init.lua}

      -- Additional config files
      ${builtins.readFile ./nvim/plugins/lsp.lua}
      ${builtins.readFile ./nvim/plugins/misc.lua}
      ${builtins.readFile ./nvim/plugins/telescope.lua}
      ${builtins.readFile ./nvim/plugins/lualine.lua}
      ${builtins.readFile ./nvim/plugins/autosession.lua}
      ${builtins.readFile ./nvim/plugins/minuet.lua}
    '';
  };
}
