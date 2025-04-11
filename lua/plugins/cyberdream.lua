return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "default",
    transparent = true,
    italic_comments = true,
    hide_fillchars = true,
    terminal_colors = false,
    cache = true,
    borderless_pickers = false,
    colors = {
      orange = "#FFB400",
      blue = "#357FFB",
      cyan = "#04D1F9",
      red = "#FF3300",
    },
    extensions = {
      telescope = true,
      notify = true,
      mini = true,
    },
  },
}
