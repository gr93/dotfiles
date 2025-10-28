-- =========================================================
-- Leader key
-- =========================================================
vim.g.mapleader = " "

-- =========================================================
-- Helper for normal mode mappings
-- =========================================================
local nmap = function(lhs, rhs, opts)
  vim.keymap.set("n", lhs, rhs, opts or { silent = true })
end

-- =========================================================
-- Normal mode mappings
-- =========================================================

-- File navigation
nmap("<leader>pv", vim.cmd.Ex, { desc = "Open explorer" })
nmap("<leader>nt", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
nmap("<C-s>", ":Oil<CR>", { desc = "Open Oil file browser" })

-- Buffers
nmap("<leader>sb", ":Telescope buffers<CR>", { desc = "List buffers" })

-- Switch to alternate file
nmap("<Leader>w", "<C-6>", { desc = "Switch to alternate file" })

-- Copy entire buffer
nmap("<Leader>ya", "ggVGy", { desc = "Yank entire buffer" })

-- Copy current file path
nmap("<leader>cp", ":let @+ = expand('%:p')<CR>", { desc = "Copy current file path" })

-- Yank GitHub permalink (normal and visual modes)
vim.keymap.set({ "n", "x" }, "<leader>gy", function()
  require("gh-permalink").yank()
end, { desc = "Yank GitHub permalink to clipboard" })

-- =========================================================
-- Visual mode mappings
-- =========================================================
vim.keymap.set("v", ">", ">gv") -- Keep selection when indenting
vim.keymap.set("v", "<", "<gv")

-- =========================================================
-- OSC52 clipboard integration on yank
-- =========================================================
local function copy()
  if vim.v.event.operator == "y" then
    local yanked_text = vim.fn.getreg('"') -- Get yanked text
    require("osc52").copy(yanked_text)     -- Send via OSC52
  end
end

vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })

