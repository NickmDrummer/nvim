-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Pick up theme changes made by the mfd-theme-toggle shell script while
-- Neovim was open (only applies when the state differs from the active theme).
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  callback = function()
    require("config.mfd_theme").sync_from_state()
  end,
  desc = "Sync mfd theme from shared state file",
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
  desc = "Disable spell for markdown",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "asm" },
  callback = function()
    vim.opt_local.commentstring = "#%s"
  end,
  desc = "MARS MIPS uses # for comments",
})
