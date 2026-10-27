-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Block cursor in every mode
vim.opt.guicursor = "n-v-c-i:block"
-- Keep normal yanks in the Wayland clipboard
vim.opt.clipboard = "unnamedplus"
vim.o.timeoutlen = 300

-- Enable LazyVim auto format
vim.g.autoformat = true
vim.opt.wrap = true -- Enable line wrap
vim.opt.termguicolors = true

-- Per-filetype indentation: tabs stay in most languages, 2 spaces in cpp
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_user_command("Google", function(o)
  -- local escaped = require('socket.url').escape(o.args)
  local escaped = vim.uri_encode(o.args)
  local url = ("https://www.google.com/search?q=%s"):format(escaped)
  vim.ui.open(url)
end, { nargs = 1, desc = "just google it" })

vim.opt.smartindent = true
vim.opt.list = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.o.cursorline = true
