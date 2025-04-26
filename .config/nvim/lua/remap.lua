vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.api.nvim_set_keymap('n', '<leader>f', ":lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>g', ":lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>l', ":lua require('fzf-lua').lines()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hd', ":lua require('gitsigns').diffthis()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hs', ":lua require('gitsigns').stage_hunk()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>hr', ":lua require('gitsigns').reset_hunk()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nt', ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

function copy()
  if vim.v.event.operator == 'y' then
    local yanked_text = vim.fn.getreg('"')  -- get the yanked text from unnamed register
    require('osc52').copy(yanked_text)      -- send it via OSC52d
  end
end
vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})

vim.keymap.set('n', '<Leader>w', '<C-6>')
