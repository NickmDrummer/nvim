return {
  "0xstepit/flow.nvim",
  lazy = true,
  -- priority = 1000,
  opts = {
    theme = {
      style = "light", -- dark or light
      contrast = "default", -- default or high
      transparent = false,
    },
    colors = {
      mode = "dark", -- default, dark, light
      fluo = "orange", -- pink, cyan, yellow, orange, green
      custom = {
        saturation = "", -- string between 0 and 100
        light = "", -- string between 0 and 100
      },
    },
    ui = {
      borders = "fluo", -- theme, inverse, fluo, none
      aggressive_spell = false,
    },
  },
}
