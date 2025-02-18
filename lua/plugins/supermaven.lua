return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_sugestion = "<A-f>",
        clear_suggestion = "<A-c>",
        accept_word = "<C-j>",
      },
      -- ignore_filetypes = { "cpp" },
      color = {
        suggestion_color = "#bdbdbd",
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
