-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--Select All
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- select and move multiple lines with autoindenting. Thank you Prime
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half page down, centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half page up, centered" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", '"_dP')

-- Replacing the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Chmod +x on current file
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>tt", function()
  require("config.theme").toggle()
end, { desc = "Toggle mfd paper/amber theme" })

vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = false })
end, { desc = "Formatting" })
