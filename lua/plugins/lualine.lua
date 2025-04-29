return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local cyberdream = {
      black = "#000000",
      black2 = "#000001",
      white = "#ffffff",
      red = "#ff3300",
      green = "#5eff6c",
      blue = "#04d1f9",
      yellow = "#f1ff5e",
      cyan = "#5ef1ff",
      orange = "#ffa500",
      pureOrange = "#ff5e00",
      magenta = "#ff5ef1",
      pink = "#ff5ea0",
      purple = "#bd5eff",
    }

    local function apply_custom_colors(theme)
      -- section Mode
      theme.normal.a.bg = cyberdream.black
      theme.normal.a.fg = cyberdream.blue
      theme.normal.a.gui = "bold"
      theme.insert.a.bg = cyberdream.black
      theme.insert.a.fg = cyberdream.green
      theme.insert.a.gui = "bold"
      theme.visual.a.bg = cyberdream.black
      theme.visual.a.fg = cyberdream.purple
      theme.visual.a.gui = "bold"
      theme.terminal.a.bg = cyberdream.black
      theme.terminal.a.fg = cyberdream.pureOrange
      theme.terminal.a.gui = "bold"

      -- section Branch
      theme.normal.b.fg = cyberdream.white

      -- section Progress
      theme.normal.y.bg = cyberdream.black
      theme.normal.y.fg = cyberdream.red

      -- section Location
      theme.normal.z.bg = cyberdream.black
      theme.normal.z.fg = cyberdream.green
      theme.normal.z.gui = "bold"
      theme.insert.z.bg = cyberdream.black
      theme.insert.z.fg = cyberdream.green
      theme.insert.z.gui = "bold"
      theme.visual.z.bg = cyberdream.black
      theme.visual.z.fg = cyberdream.green
      theme.visual.z.gui = "bold"
      theme.terminal.z.bg = cyberdream.black
      theme.terminal.z.fg = cyberdream.green
      theme.terminal.z.gui = "bold"
      return theme
    end

    local function get_lualine_theme()
      local theme_name = vim.g.colors_name or "auto"
      local status, theme = pcall(require, "lualine.themes" .. theme_name)
      if status then
        return apply_custom_colors(theme)
      else
        return apply_custom_colors(require("lualine.themes.auto"))
      end
    end

    local function setup_lualine()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = get_lualine_theme(),
          component_separators = { left = "󰤃", right = "󰤃" },
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
    end

    setup_lualine()

    vim.api.nvim_create_autocmd("Colorscheme", {
      pattern = "*",
      callback = function()
        setup_lualine()
      end,
    })
  end,
}
