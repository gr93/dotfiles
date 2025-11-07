-- lazy.nvim plugin spec
return {
  {
    "unblevable/quick-scope",
    event = "VeryLazy",  -- load when lazy events happen
    config = function()
      -- optional: highlight characters
      vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
    end
  }
}

