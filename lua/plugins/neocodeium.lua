-- add this to the file where you setup your other plugins:
return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup({
        enabled = true,
      })
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
      vim.keymap.set("i", "<Opt-f>", neocodeium.accept)
      vim.keymap.set("i", "<A-a>", neocodeium.accept_line)
      vim.keymap.set("i", "<Opt-a>", neocodeium.accept_line)
      vim.keymap.set("i", "<A-e>", neocodeium.cycle_or_complete)
      vim.keymap.set("i", "<Opt-n>", neocodeium.cycle_or_complete)
    end,
  },
}
