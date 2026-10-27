-- AI inline completion (Supermaven).
-- Loads on the first insert-mode entry; the previous spec had both
-- `lazy = true` without a trigger and `condition = false`, so it never ran.
return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<A-f>",
        clear_suggestion = "<A-c>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      color = {
        suggestion_color = "#3ebcd5",
        cterm = 244,
      },
      log_level = "off",
      disable_inline_completion = false,
      disable_keymaps = false,
    })
  end,
}
