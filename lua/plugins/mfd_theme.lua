return {
  "kungfusheep/mfd.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme mfd-nerv")
    vim.opt.guicursor = {
      "n:block-CursorNormal",
      "v:block-CursorVisual",
      "i:block-CursorInsert",
      "r-cr:block-CursorReplace",
      "c:block-CursorCommand",
    }
  end,
}
