-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- The event data property will contain a string with either "default" or "light" respectively
vim.api.nvim_create_autocmd("User", {
  pattern = "CyberdreamToggleMode",
  callback = function(event)
    -- Your custom code here!
    -- For example, notify the user that the colorscheme has been toggled
    print("Switched to " .. event.data .. " mode!")
  end,
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})
