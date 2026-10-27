-- Supermaven AI completion on top of the official LazyVim
-- "ai.supermaven" extra (declared in lazyvim.json). The extra wires the
-- event/cmds, the lualine/noice integrations and inline handling
-- (vim.g.ai_cmp stays false in options.lua, so supermaven keeps showing its
-- own inline preview instead of the blink-compat source path). Only the
-- personal keymaps and colors live here.
return {
  "supermaven-inc/supermaven-nvim",
  opts = {
    keymaps = {
      accept_suggestion = "<A-f>",
      clear_suggestion = "<A-c>",
      accept_word = "<C-j>",
    },
    color = {
      suggestion_color = "#3ebcd5",
      cterm = 244,
    },
    log_level = "off",
    disable_inline_completion = false,
    disable_keymaps = false,
  },
}
