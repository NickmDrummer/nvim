-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- vim.opt.winbar = "%=%m %f"
-- Enable LazyVim auto format
vim.g.autoformat = true
vim.opt.wrap = true -- Enable line wrap
vim.opt.termguicolors = true

-- Opciones globales
-- vim.o.tabstop = 4 --  A TAB character looks like 4 spaces
-- vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
-- vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
-- vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

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

-- INFO: Moonfly Config Begin
vim.g.moonflyItalics = true
vim.g.moonflyCursorColor = true
-- Uses moonfly background and foreground colors in Neovim floating windows
vim.g.moonflyNormalFloat = true
vim.g.moonflyTransparent = false

-- Display diagnostic virtual text in color
vim.g.moonflyVirtualText = true
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "single",
-- })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
--   border = "single",
-- })
-- vim.diagnostic.config({ float = { border = "single" } })
-- INFO: Moonfly Config End
