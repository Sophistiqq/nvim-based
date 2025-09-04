-- lua/lsp.lua
-- Updated LSP configuration for better TypeScript support

local servers = {
  "lua_ls",
  "html",
  "cssls",
  "emmet_language_server",
  "vtsls",
  "svelte"
}

-- Enable LSP servers
vim.lsp.enable(servers)

-- Configure specific LSP settings
local lspconfig = require('lspconfig')


-- Lua LSP configuration
lspconfig.vtsls.setup({
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- HTML LSP configuration
lspconfig.html.setup({
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- CSS LSP configuration
lspconfig.cssls.setup({
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- Emmet LSP configuration
lspconfig.emmet_language_server.setup({
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  filetypes = { "html", "css", "svelte" },
})

lspconfig.svelte.setup({
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})
