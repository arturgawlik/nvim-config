-- vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Better escape terminal" })
-- vim.keymap.set('t', 'jj', [[<C-\><C-n>]], { desc = "Better escape terminal" })
local n_opts = {silent = true, noremap = true}
local t_opts = {silent = true}
--
local keymap = vim.keymap.set
--
-- Normal mode
-- Better window navigation
keymap('n', '<C-Left>',  '<C-w>h', n_opts)
keymap('n', '<C-Down>',  '<C-w>j', n_opts)
keymap('n', '<C-Up>',    '<C-w>k', n_opts)
keymap('n', '<C-Right>', '<C-w>l', n_opts)

-- Terminal mode
keymap('t', '<esc>',     '<C-\\><C-N>', t_opts)
keymap('t', 'jj',     '<C-\\><C-N>', t_opts)
keymap('t', '<C-Left>',  '<C-\\><C-N><C-w>h', t_opts)
keymap('t', '<C-Down>',  '<C-\\><C-N><C-w>j', t_opts)
keymap('t', '<C-Up>',    '<C-\\><C-N><C-w>k', t_opts)
keymap('t', '<C-Right>', '<C-\\><C-N><C-w>l', t_opts)

-- local function set_terminal_keymaps()
--   local opts = {buffer = 0}
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', '<C-h>', vim.cmd.wincmd("h"), opts)
--   vim.keymap.set('t', '<C-j>', vim.cmd.wincmd("j"), opts)
--   vim.keymap.set('t', '<C-k>', vim.cmd.wincmd("k"), opts)
--   vim.keymap.set('t', '<C-l>', vim.cmd.wincmd("l"), opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.api.nvim_create_autocmd("TermOpen", {
--   pattern = [[term://*]],
--   callback = set_terminal_keymaps
-- })

