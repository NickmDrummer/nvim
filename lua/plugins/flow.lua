return {
  "0xstepit/flow.nvim",
  lazy = true,
  -- priority = 1000,
  opts = {
    theme = {
      style = "light", -- dark or light
      contrast = "high", -- default or high
      transparent = false,
    },
    colors = {
      mode = "dark", -- default, dark, light
      fluo = "pink", -- pink, cyan, yellow, orange, green
      custom = {
        saturation = "", -- string between 0 and 100
        light = "", -- string between 0 and 100
      },
    },
    ui = {
      borders = "inverse", -- theme, inverse, fluo, none
      aggressive_spell = false,
    },
  },
}
