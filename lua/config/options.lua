-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- vim.opt.winbar = "%=%m %f"
local opt = vim.opt
-- Enable LazyVim auto format
vim.g.autoformat = true
opt.wrap = true -- Enable line wrap
opt.termguicolors = true

vim.o.tabstop = 4 --  A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.opt.list = false

-- INFO: Moonfly Config Begin
vim.g.moonflyItalics = true
vim.g.moonflyCursorColor = true
-- Uses moonfly background and foreground colors in Neovim floating windows
vim.g.moonflyNormalFloat = true
vim.g.moonflyTransparent = false

-- Display diagnostic virtual text in color
vim.g.moonflyVirtualText = true
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
  border = "single",
})
vim.diagnostic.config({ float = { border = "single" } })
-- INFO: Moonfly Config End
