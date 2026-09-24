return {
  "kungfusheep/mfd.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Let Ghostty's background show through the editor while keeping floating
    -- windows opaque for readability.
    -- for _, group in ipairs({ "Normal", "NormalNC", "SignColumn", "FoldColumn", "EndOfBuffer", "LineNr" }) do
    --   vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    -- end

    -- vim.opt.guicursor = {
    --   "n:block-CursorNormal",
    --   "v:block-CursorVisual",
    --   "i:block-CursorInsert",
    --   "r-cr:block-CursorReplace",
    --   "c:block-CursorCommand",
    -- }
  end,
}
