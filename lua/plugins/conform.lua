return {
  {
    "stevearc/conform.nvim",
    -- changing conform.nvim
    opts = function()
      local opts = {
        formatters_by_ft = {
          go = { "gofumpt", "goimports" },
          c = { "clang-format" },
          cs = { "csharpier" },
          html = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          yaml = { "prettier" },
          lua = { "stylua" },
        },
        formatter = {
          csharpier = {
            command = "dotnet-csharpier",
            args = { "--write-stdout" },
          },
        },
      }
      return opts
    end,
  },
}
