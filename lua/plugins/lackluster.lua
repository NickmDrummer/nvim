return {
  "slugbyte/lackluster.nvim",
  lazy = true,
  -- priority = 1000,
  opts = {
    tweak_background = {
      normal = "none", -- 'none' to transparent
      telescope = "default",
      menu = "default",
      popup = "default",
    },
    tweak_highlight = {
      ["@keyword"] = {
        overwrite = false,
        bold = false,
        italic = true,
      },
      ["@function"] = {
        overwrite = true,
        link = "@funciton",
      },
    },
  },
}
