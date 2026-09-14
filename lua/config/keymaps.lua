local map = vim.keymap.set

-- File
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":qa<CR>")

-- Buffers
map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>ls", ":ls<CR>")

-- Clear search highlight
map("n", "<Esc>", ":noh<CR><Esc>")

-- Disable middle mouse paste
for _, m in ipairs({ "<MiddleMouse>", "<2-MiddleMouse>", "<3-MiddleMouse>", "<4-MiddleMouse>" }) do
  map({ "n", "i" }, m, "<Nop>")
end
