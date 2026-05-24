require('minuet').setup {
    provider = 'openai_fim_compatible',
    n_completions = 1,
    context_window = 16384,
    provider_options = {
        openai_fim_compatible = {
            api_key = 'TERM',
            name = 'Ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder:7b',
            optional = {
                max_tokens = 56,
                top_p = 0.9,
            },
        },
    },

    virtualtext = {
        auto_trigger_ft = { 'lua', 'cpp', 'gdscript', 'nix', 'rust', 'cs', 'razor' },
        keymap = {
            -- accept whole completion
            accept = '<A-A>',
            -- accept one line
            accept_line = '<A-a>',
            -- accept n lines (prompts for number)
            -- e.g. "A-z 2 CR" will accept 2 lines
            accept_n_lines = '<A-z>',
            -- Cycle to prev completion item, or manually invoke completion
            prev = '<A-[>',
            -- Cycle to next completion item, or manually invoke completion
            next = '<A-]>',
            dismiss = '<A-e>',
        },
    },
}

vim.keymap.set("n", "<leader>i", "<cmd>Minuet virtualtext toggle<CR>", { desc = "Toggle Minuet Virtual Text" })
