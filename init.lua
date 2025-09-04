require("opts")
require("packages")
require("setups")
require("keymaps")
require("lsp")

vim.cmd("colorscheme catppuccin-frappe")

vim.api.nvim_set_hl(0, 'LineNR', { fg = '#cccccc' })
