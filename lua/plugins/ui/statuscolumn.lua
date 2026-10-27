-- Fine-tune LazyVim's statuscolumn (rendered by snacks.statuscolumn,
-- already registered in LazyVim's options.lua). No extra plugin needed;
-- mini.statuscolumn/statuscol.nvim would be redundant duplication.
-- Changes: git signs move to the left edge, folds recolor themselves with
-- the active GitSign highlight, and open folds get their icon shown.
return {
  "folke/snacks.nvim",
  opts = {
    statuscolumn = {
      left = { "mark", "git", "sign" },
      right = { "fold" },
      folds = {
        open = true,
        git_hl = true,
      },
    },
  },
}
