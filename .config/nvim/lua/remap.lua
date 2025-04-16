vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>f', ":lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', ":lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ":lua require('fzf-lua').lines()<CR>", { noremap = true, silent = true })
