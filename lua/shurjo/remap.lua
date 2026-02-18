vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>pv", "<CMD>Neotree position=current<CR>")

-- tabs
map("n", "<leader>h", vim.cmd.tabprevious)
map("n", "<leader>l", vim.cmd.tabnext)
map("n", "<leader>tn", "<CMD>tabnew<CR><CMD>edit .<CR>")
map("n", "<leader>tc", vim.cmd.tabclose)

-- splits
map("n", "<leader>n", vim.cmd.vsplit)
map("n", "<leader>m", vim.cmd.split)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- tree
map("n", "<leader>b", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- lsp 
map("n", "<leader>y", vim.diagnostic.open_float)

-- csv
map("n", "<leader>vv", "<CMD>CsvViewToggle display_mode=border header_lnum=1<CR>")

-- formatting 
vim.keymap.set({ "n", "v" }, "<leader>f", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file or range (in visual mode)" })

-- folding 
map("n", "<leader>c", "za")  -- toggle fold 

map("n", "<F20>", '"+y')
map("v", "<F20>", '"+y')
