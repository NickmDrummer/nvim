-- Diagnostics rendered as tiny inline cards in front of the offending
-- line, instead of LazyVim's default virtual text. LazyVim's floating
-- window (CursorHold) still shows the full message for long/multi-line
-- diagnostics, so nothing is lost. Presets to try: "minimal", "ghost",
-- "modern" — one word swap.
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function(_, opts)
    -- LazyVim enables virtual_text at startup; turn it off before this
    -- plugin starts rendering so the two never stack.
    vim.diagnostic.config({ virtual_text = false })
    require("tiny-inline-diagnostic").setup(opts)
  end,
  opts = {
    preset = "minimal",
    options = {
      show_source = { enabled = false },
      overflow = { mode = "wrap" },
    },
  },
}
