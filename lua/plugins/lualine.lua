return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local function apply_custom_colors(theme)
      -- Keep the foreground/background defined by the colorscheme.
      -- Only ensure every section Lualine may use actually exists.
      local modes = { "normal", "insert", "visual", "replace", "command", "terminal", "inactive" }
      local sections = { "a", "b", "c", "x", "y", "z" }

      for _, mode in ipairs(modes) do
        theme[mode] = theme[mode] or {}
        local fallback = theme[mode].c or theme.normal.c or theme.normal.b or {}

        for _, section in ipairs(sections) do
          if not theme[mode][section] or vim.tbl_isempty(theme[mode][section]) then
            theme[mode][section] = vim.deepcopy(fallback)
          end
        end
      end

      -- Custom color for the INSERT block
      if vim.g.colors_name and vim.g.colors_name:match("^mfd") then
        theme.insert.a = vim.tbl_extend("force", theme.insert.a or {}, {
          fg = "#001008",
          bg = "#ff4e40",
          gui = "bold",
        })
      end

      return theme
    end

    local function get_lualine_theme()
      local theme_name = vim.g.colors_name or "auto"
      local module_name = "lualine.themes" .. theme_name
      -- The theme is built from the active colorscheme when the module loads,
      -- so drop the cached copy to rebuild it instead of reusing stale colors.
      package.loaded[module_name] = nil
      local status, theme = pcall(require, module_name)
      if not status then
        package.loaded["lualine.themes.auto"] = nil
        theme = require("lualine.themes.auto")
      end
      -- Copy before patching so the cached module table is never mutated.
      return apply_custom_colors(vim.deepcopy(theme))
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
