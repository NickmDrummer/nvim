-- Breadcrumbs: clickable symbol pills in the winbar.
-- LazyVim's statusline stays intact; since LazyVim defines no winbar, this
-- cleanly owns it. Truncation keeps long paths readable in narrow splits.
return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "<leader>;",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Pick symbol (dropbar)",
    },
  },
  opts = {
    bar = {
      truncate = true,
    },
  },
}
