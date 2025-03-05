return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    transparent = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = false, bold = true },
      functions = { italic = true },
      variables = { italic = false },
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
