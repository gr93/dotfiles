-- lazy.nvim spec for kevinhwang91/nvim-hlslens
return {
  {
    "kevinhwang91/nvim-hlslens",
    event = "CmdlineEnter",  -- lazy-load when entering commandline (searches start here)
    config = function()
      -- core setup (tweak any of these fields)
      require("hlslens").setup({
        auto_enable        = true,      -- enable plugin automatically
        enable_incsearch   = true,      -- show lens while using incsearch
        calm_down          = true,      -- clear lens when cursor goes away / text changes
        nearest_only       = false,     -- only show the nearest match by default
        nearest_float_when = "auto",    -- 'auto' / 'always' / 'never' for floating near lens
        float_shadow_blend = 50,
        virt_priority      = 100,
        -- override_lens = function(render, posList, nearest, idx, relIdx)
        --   -- Example override: slightly customize virtual text. Uncomment to use.
        --   local sfw = vim.v.searchforward == 1
        --   local indicator = ""
        --   local absRelIdx = math.abs(relIdx)
        --   if absRelIdx > 1 then
        --     indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and '▲' or '▼')
        --   elseif absRelIdx == 1 then
        --     indicator = sfw ~= (relIdx == 1) and '▲' or '▼'
        --   end
        --   local lnum, col = unpack(posList[idx])
        --   local chunks
        --   if nearest then
        --     local cnt = #posList
        --     local text = indicator ~= "" and ('[%s %d/%d]'):format(indicator, idx, cnt) or ('[%d/%d]'):format(idx, cnt)
        --     chunks = {{' '}, {text, 'HlSearchLensNear'}}
        --   else
        --     local text = ('[%s %d]'):format(indicator, idx)
        --     chunks = {{' '}, {text, 'HlSearchLens'}}
        --   end
        --   render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
        -- end,
      })

      -- default keymaps recommended by the README:
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)

      -- optional: add mappings for <C-g>/<C-t> to go next/prev search result
      vim.keymap.set('n', '<C-g>', "<Cmd>lua require('hlslens').next()<CR>", { noremap = true, silent = true })
      vim.keymap.set('n', '<C-t>', "<Cmd>lua require('hlslens').prev()<CR>", { noremap = true, silent = true })
    end,
  },
}

