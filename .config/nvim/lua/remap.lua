vim.g.mapleader = " "
--vim.g.clipboard = {
--  name = 'OSC 52',
--  copy = {
--    ['+'] = require('ui.vim.clipboard.osc52').copy,
--    ['*'] = require('ui.vim.clipboard.osc52').copy,
--  },
--  paste = {
--    ['+'] = require('ui.vim.clipboard.osc52').paste,
--    ['*'] = require('ui.vim.clipboard.osc52').paste,
--  },
--}
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>f', ":lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ":lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ":lua require('fzf-lua').lines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hd', ":lua require('gitsigns').diffthis()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hs', ":lua require('gitsigns').stage_hunk()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hr', ":lua require('gitsigns').reset_hunk()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>w', '<C-6>')
