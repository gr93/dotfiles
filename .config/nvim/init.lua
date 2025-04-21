local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
vim.opt.runtimepath:append(vim.fn.expand("~/.vim/after"))

-- Set packpath to match runtimepath
vim.opt.packpath = vim.opt.runtimepath:get()

-- Require your Lua plugins
require('remap')
require('plugins')

-- Source your old .vimrc
vim.cmd("source " .. vim.fn.expand("~/.vimrc"))

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

