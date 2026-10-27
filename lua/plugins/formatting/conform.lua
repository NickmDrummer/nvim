-- Formatting rules per filetype (runs on every save)
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      go = { "gofumpt", "goimports" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cs = { "csharpier" },
      haskell = { "ormolu" },
      lua = { "stylua" },
      markdown = { "prettier" },
      json = { "prettier" },
      sh = { "shfmt" },
    },
    -- Note: the config key is `formatters` (plural); the original `formatter`
    -- override was silently ignored by conform.
    formatters = {
      csharpier = {
        command = "dotnet-csharpier",
        args = { "--write-stdout" },
      },
    },
  },
}
