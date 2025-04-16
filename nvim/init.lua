vim.opt.runtimepath:prepend(vim.fn.expand("~/.vim"))
vim.opt.runtimepath:append(vim.fn.expand("~/.vim/after"))

-- Set packpath to match runtimepath
vim.opt.packpath = vim.opt.runtimepath:get()

-- Require your Lua plugins
require('remap')
require('plugins')

-- Source your old .vimrc
vim.cmd("source " .. vim.fn.expand("~/.vimrc"))

