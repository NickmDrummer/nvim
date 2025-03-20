return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local actualTheme = require("lualine.themes.cyberdream")
    local cyberdream = {
      black = "#000000",
      black2 = "#000002",
      white = "#ffffff",
      red = "#ff6e5e",
      green = "#5eff6c",
      blue = "#04d1f9",
      yellow = "#f1ff5e",
      cyan = "#5ef1ff",
      orange = "#ffbd5e",
      pureOrange = "#ff5e00",
      magenta = "#ff5ef1",
      pink = "#ff5ea0",
      purple = "#bd5eff",
    }
    -- section Mode
    actualTheme.normal.a.bg = cyberdream.blue
    actualTheme.normal.a.fg = cyberdream.black2
    actualTheme.insert.a.bg = cyberdream.green
    actualTheme.insert.a.fg = cyberdream.black2
    actualTheme.visual.a.bg = cyberdream.purple
    actualTheme.visual.a.fg = cyberdream.white
    actualTheme.terminal.a.bg = cyberdream.pureOrange
    actualTheme.terminal.a.fg = cyberdream.white

    -- section Branch
    actualTheme.normal.b.fg = cyberdream.white

    -- section Progress
    actualTheme.normal.y.bg = cyberdream.black2
    actualTheme.normal.y.fg = cyberdream.pink

    -- section Location
    actualTheme.normal.z.bg = cyberdream.pink
    actualTheme.normal.z.fg = cyberdream.black2
    actualTheme.insert.z.bg = cyberdream.pink
    actualTheme.insert.z.fg = cyberdream.black2
    actualTheme.visual.z.bg = cyberdream.pink
    actualTheme.visual.z.fg = cyberdream.black2
    actualTheme.terminal.z.bg = cyberdream.pink
    actualTheme.terminal.z.fg = cyberdream.black2

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = actualTheme,
        component_separators = { left = "⏽", right = "⏽" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          "mode",
        },
        lualine_b = {
          { "branch", icon = " " },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            colored = true,
          },
        },
        lualine_c = {},
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            update_in_insert = true,
            colored = true,
          },
          { "filetype", icon_only = true },
          "filename",
        },
        lualine_y = {
          "progress",
        },
        lualine_z = { { "location", icon = " " } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
