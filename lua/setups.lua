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

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lsp = {
        name = 'LSP',
        module = 'blink.cmp.sources.lsp',
        enabled = true,
        transform_items = function(_, items)
          return vim.tbl_filter(function(item)
            return item.kind ~= require('blink.cmp.types').CompletionItemKind.Text
          end, items)
        end,
      },
    },
  },

  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = {
      enabled = true,
    },
  },

  signature = {
    enabled = true,
  },

  fuzzy = {
    implementation = "lua",
    sorts = { "score", "sort_text" },
  },
})
require("tiny-inline-diagnostic").setup({
  preset = "minimal",

  transparent_bg = false,

  transparent_cursorline = true,

  hi = {
    error = "DiagnosticError",

    warn = "DiagnosticWarn",

    info = "DiagnosticInfo",

    hint = "DiagnosticHint",

    arrow = "NonText",
    background = "CursorLine",

    mixing_color = "Normal",
  },

  options = {
    show_source = {
      enabled = false,
      if_many = false,
    },

    use_icons_from_diagnostic = false,

    set_arrow_to_diag_color = false,

    add_messages = true,

    throttle = 20,
    softwrap = 30,

    multilines = {
      enabled = false,

      always_show = false,

      trim_whitespaces = false,

      tabstop = 4,
    },

    show_all_diags_on_cursorline = false,

    enable_on_insert = false,

    enable_on_select = false,

    overflow = {
      mode = "wrap",

      padding = 0,
    },

    break_line = {
      enabled = false,

      after = 30,
    },

    format = nil,

    virt_texts = {
      priority = 2048,
    },

    severity = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
      vim.diagnostic.severity.INFO,
      vim.diagnostic.severity.HINT,
    },

    overwrite_events = nil,
  },

  disabled_ft = {}
})


require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "typescript",
    "javascript",
    "tsx",
    "json",
    "html",
    "css"
  },

  sync_install = false,
  auto_install = true,

  ignore_install = {},

  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
