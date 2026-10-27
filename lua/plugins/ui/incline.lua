-- Floating filename tag per window (top-right corner). Shows only in
-- multi-window sessions: redundant noise over the statusline when a single
-- window is open. Subtle comment-colored text on the cursorline background
-- so it stays readable with any active theme (mfd, omarchy, cyberdream).
return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  config = function()
    local icon_ok, devicons = pcall(require, "nvim-web-devicons")
    require("incline").setup({
      window = {
        margin = {
          vertical = { top = 0, bottom = 0 },
          horizontal = { left = 0, right = 0 },
        },
        padding = { left = 1, right = 1 },
        placement = { vertical = "top", horizontal = "right" },
        winhighlight = {
          active = { Normal = "CursorLine" },
          inactive = { Normal = "CursorLine" },
        },
      },
      hide = {
        focused_win = false,
        only_win = true,
      },
      render = function(props)
        local buf = props.buf
        if vim.bo[buf].buftype ~= "" then
          return "" -- no tags for terminals, quickfix, etc.
        end
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
        if filename == "" then
          filename = "[no name]"
        end
        local icon, icon_hl
        if icon_ok then
          local ok, v = pcall(devicons.get_icon, filename, vim.fn.fnamemodify(filename, ":e"), { default = true })
          if ok then
            icon, icon_hl = v[1], v[2]
          end
        end
        local parts = {}
        if icon then
          parts[#parts + 1] = { icon, group = icon_hl }
          parts[#parts + 1] = { " " }
        end
        parts[#parts + 1] = { filename, group = "Comment" }
        return parts
      end,
    })
  end,
}
