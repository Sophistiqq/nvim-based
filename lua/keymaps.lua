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
