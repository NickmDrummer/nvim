return {
  "supermaven-inc/supermaven-nvim",
  lazy = false,
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_sugestion = "<A-f>",
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
      condition = function()
        return false
      end,
    })
  end,
}
