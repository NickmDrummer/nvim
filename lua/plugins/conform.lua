return {
  {
    "stevearc/conform.nvim",
    -- changing conform.nvim
    opts = function()
      local opts = {
        formatters_by_ft = {
          go = { "goimports" },
          c = { "clang-format" },
        },
      }
      return opts
    end,
  },
}
