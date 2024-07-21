return {
  {
    "stevearc/conform.nvim",
    -- changing conform.nvim
    opts = function()
      local opts = {
        formatters_by_ft = {
          go = { "gofumpt" },
          c = { "clang-format" },
          html = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          yaml = { "prettier" },
        },
      }
      return opts
    end,
  },
}
