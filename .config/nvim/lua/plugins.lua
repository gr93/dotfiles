vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fzf-lua plugin
  use {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' } -- optional, for file icons
  }
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
end)


