# .luarc.json

```json
{
    "diagnostics.globals": [
        "vim"
    ]
}
```

# init.lua

```lua
require("opts")
require("packages")
require("setups")
require("keymaps")
require("lsp")

vim.cmd("colorscheme night-owl")

```

# lua/cmd.lua

```lua
vim.cmd(":hi statusline guibg=NONE")
vim.cmd(":hi statusline guifg=WHITE")

```

# lua/keymaps.lua

```lua
local map = vim.keymap.set

map('n', ';', ':')
map('n', '<ESC>', ':noh<CR>')
map('n', '<leader>fm', vim.lsp.buf.format, { desc = "Format Document" })
map('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Source Config" })
map('n', '<leader>w', ':write<CR>', { desc = "Write/Save File" })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Open Code Action" })
map('n', '<leader>pr', ':Precognition toggle<CR>')
map('n', '<leader>th', ':Telescope colorscheme<CR>', {desc = "Choose Theme"})

-- Telescope keymaps
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = "Find File in Workspace" })
map('n', '<leader>fw', ':Telescope live_grep<CR>', { desc = "Find Word in Workspace" })
map('n', '<leader>fb', ":Telescope buffers<CR>", { desc = "Show opened Buffers" })

-- Buffer keymaps
map('n', '<leader>x', ':bdelete<CR>', { desc = "Close Buffer" })
map('n', '<leader>q', ':bdelete<CR>', { desc = "Close Buffer" })
map('n', '<C-Tab>', ':BufferNext<CR>')
map('n', '<S-Tab>', ':BufferPrevious<CR>')

-- Mappings of Movements for Windows switchings
map('n', '<C-Left>', '<C-w>h')
map('n', '<C-Right>', '<C-w>l')
map('n', '<C-Up>', '<C-w>k')
map('n', '<C-Down>', '<C-w>j')

-- ToggleTerm keymaps
map('n', '<M-i>', ':ToggleTerm direction=float<CR>', { silent = true })
map('n', '<M-h>', ':ToggleTerm direction=horizontal<CR>', { silent = true })
map('n', '<M-v>', ':ToggleTerm direction=vertical<CR>', { silent = true })
map('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })

```

# lua/lsp.lua

```lua
-- Just include the language server in the table and that's it
local servers = { "lua_ls" , "html", "cssls", "emmet_language_server", "ts_ls" }
vim.lsp.enable(servers)

```

# lua/opts.lua

```lua
vim.opt.number = true
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"



```

# lua/packages.lua

```lua
vim.pack.add({
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' }, -- optional
  { src = "https://github.com/windwp/nvim-autopairs" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/romgrk/barbar.nvim" },
  { src = "https://github.com/romgrk/barbar.nvim" },
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/tris203/precognition.nvim" },
  { src = "https://github.com/sphamba/smear-cursor.nvim" },
  { src = "https://github.com/akinsho/toggleterm.nvim" },
  { src = "https://github.com/olimorris/onedarkpro.nvim" },
  { src = "https://github.com/oxfist/night-owl.nvim" },
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})



```

# lua/setups.lua

```lua
require("telescope").setup({
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
})

require("lualine").setup({
  sections = {
    lualine_c = {
      'lsp_status',
    }
  }
})
require("smear_cursor").setup()
require("precognition").setup({
  startVisible = false
})
require("barbar").setup({
  tabpages = true,
  animation = true,
  icons = {
    preset = "slanted",
    buffer_index = false,
    buffer_number = false,
  },
  no_name_title = "[Empty]",
  sidebar_filetypes = {
    NvimTree = true,
  },
})
require("which-key").setup({})
require("nvim-autopairs").setup()
require("nvim-tree").setup({
  renderer = {
    group_empty = true,
    root_folder_label = false
  },
  filters = {
    dotfiles = true,
  },
})
require("toggleterm").setup({
})

require("blink.cmp").setup({
  keymap = { preset = "super-tab" },
  fuzzy = { implementation = "lua"}

})

require("tiny-inline-diagnostic").setup({
    -- Style preset for diagnostic messages
    -- Available options: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
    preset = "minimal",

    -- Set the background of the diagnostic to transparent
    transparent_bg = false,

    -- Set the background of the cursorline to transparent (only for the first diagnostic)
    -- Default is true in the source code, not false as in the old README
    transparent_cursorline = true,

    hi = {
        -- Highlight group for error messages
        error = "DiagnosticError",

        -- Highlight group for warning messages
        warn = "DiagnosticWarn",

        -- Highlight group for informational messages
        info = "DiagnosticInfo",

        -- Highlight group for hint or suggestion messages
        hint = "DiagnosticHint",

        -- Highlight group for diagnostic arrows
        arrow = "NonText",

        -- Background color for diagnostics
        -- Can be a highlight group or a hexadecimal color (#RRGGBB)
        background = "CursorLine",

        -- Color blending option for the diagnostic background
        -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
        -- Default is "Normal" in the source code
        mixing_color = "Normal",
    },

    options = {
        -- Display the source of the diagnostic (e.g., basedpyright, vsserver, lua_ls etc.)
        show_source = {
            enabled = false,
            -- Show source only when multiple sources exist for the same diagnostic
            if_many = false,
        },

        -- Use icons defined in the diagnostic configuration instead of preset icons
        use_icons_from_diagnostic = false,

        -- Set the arrow icon to the same color as the first diagnostic severity
        set_arrow_to_diag_color = false,

        -- Add messages to diagnostics when multiline diagnostics are enabled
        -- If set to false, only signs will be displayed
        add_messages = true,

        -- Time (in milliseconds) to throttle updates while moving the cursor
        -- Increase this value for better performance on slow computers
        -- Set to 0 for immediate updates and better visual feedback
        throttle = 20,

        -- Minimum message length before wrapping to a new line
        softwrap = 30,

        -- Configuration for multiline diagnostics
        -- Can be a boolean or a table with detailed options
        multilines = {
            -- Enable multiline diagnostic messages
            enabled = false,

            -- Always show messages on all lines for multiline diagnostics
            always_show = false,

            -- Trim whitespaces from the start/end of each line
            trim_whitespaces = false,

            -- Replace tabs with this many spaces in multiline diagnostics
            tabstop = 4,
        },

        -- Display all diagnostic messages on the cursor line, not just those under cursor
        show_all_diags_on_cursorline = false,

        -- Enable diagnostics in Insert mode
        -- If enabled, consider setting throttle to 0 to avoid visual artifacts
        enable_on_insert = false,

        -- Enable diagnostics in Select mode (e.g., when auto-completing with Blink)
        enable_on_select = false,

        -- Manage how diagnostic messages handle overflow
        overflow = {
            -- Overflow handling mode:
            -- "wrap" - Split long messages into multiple lines
            -- "none" - Do not truncate messages
            -- "oneline" - Keep the message on a single line, even if it's long
            mode = "wrap",

            -- Trigger wrapping this many characters earlier when mode == "wrap"
            -- Increase if the last few characters of wrapped diagnostics are obscured
            padding = 0,
        },

        -- Configuration for breaking long messages into separate lines
        break_line = {
            -- Enable breaking messages after a specific length
            enabled = false,

            -- Number of characters after which to break the line
            after = 30,
        },

        -- Custom format function for diagnostic messages
        -- Function receives a diagnostic object and should return a string
        -- Example: function(diagnostic) return diagnostic.message .. " [" .. diagnostic.source .. "]" end
        format = nil,

        -- Virtual text display configuration
        virt_texts = {
            -- Priority for virtual text display (higher values appear on top)
            -- Increase if other plugins (like GitBlame) override diagnostics
            priority = 2048,
        },

        -- Filter diagnostics by severity levels
        -- Available severities: vim.diagnostic.severity.ERROR, WARN, INFO, HINT
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
            vim.diagnostic.severity.HINT,
        },

        -- Events to attach diagnostics to buffers
        -- Default: { "LspAttach" }
        -- Only change if the plugin doesn't work with your configuration
        overwrite_events = nil,
    },

    -- List of filetypes to disable the plugin for
    disabled_ft = {}
})

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

```

