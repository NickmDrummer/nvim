return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      options = {
        styles = {
          comments = "NONE", -- "italic,bold"
          keywords = "NONE",
          variables = "NONE",
          constants = "NONE",
          strings = "NONE",
          operators = "NONE",
          numbers = "NONE",
          functions = "NONE",
        },
        palettes = {
          all = {
            bg1 = "#c5c0ce",
            bg0 = "#c5c0ce",
          },
        },
      },
    })
  end,
}
