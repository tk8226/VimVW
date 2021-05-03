O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'tokyonight',
    hidden_files = true,
    wrap_lines = false,
    shell = 'zsh',

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true}
    },

    database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
    
    python = {
        formatter = 'yapf',
        autoformat = true,
        isort = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    
    lua = {
        formatter = 'lua-format',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        formatter = 'shfmt',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    
    -- javascript, typescript, javascriptreact, typescriptreact
    tsserver = {
        -- @usage can be 'eslint'
        linter = nil,
        formatter = 'prettier',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = true,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    
    tailwindls = {filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}},

}


DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
