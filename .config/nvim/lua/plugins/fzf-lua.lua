 return {
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
