local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fzf-lua plugin
  use {
    'ibhagwan/fzf-lua',
    config = function()
      require('fzf-lua').setup({
        files = {
          formatter = "path.filename_first"
        },
        grep = {
          formatter = "path.filename_first"
        },
	defaults = { file_icons = false }
      })
    end
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
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
          update_root = {
            enable = true,
            ignore_list = {},
          }
        },
	renderer = {
	  icons = {
	    show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
              modified = false,
              hidden = false,
              diagnostics = false,
              bookmarks = false,
            }
	  }
	}
      })
    end
  }
  use {
    'ojroques/nvim-osc52',
    config = function()
      require('osc52').setup {
        max_length = 0,        -- No limit on selection size
        silent = false,        -- Notify on successful copy
        trim = false,          -- Don't trim the selection
	tmux_passthrough = true
      }
    end
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)


