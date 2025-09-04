-- Just include the language server in the table and that's it
local servers = { "lua_ls", "svelte", "html", "cssls", "vtsls", "emmet_language_server", "ts_ls" }
vim.lsp.enable(servers)
