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
local cmp = require("cmp")
require("cmp").setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
})
require("toggleterm").setup({
})
