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
    cache = false,
    borderless_pickers = false,
    colors = {
      orange = "#FFA500",
      cyan = "#04D1F9",
    },
    extensions = {
      telescope = true,
      notify = true,
      mini = true,
    },
  },
}
