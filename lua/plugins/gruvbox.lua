return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      return {
        -- transparent = true,
        styles = {
          -- sidebars = "transparent",
          -- floats = "transparent",
          italics = true,
          comments = "italic",
          keywords = "italic",
          functions = "italic",
        },
      }
    end,
  },

  -- -- --Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
}
