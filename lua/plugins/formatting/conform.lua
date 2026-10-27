-- Formatting rules per filetype (runs on every save).
-- C# lives in the dotnet extra (extra `lang.dotnet` owns cs->csharpier).
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      go = { "gofumpt", "goimports" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      haskell = { "ormolu" },
      lua = { "stylua" },
      markdown = { "prettier" },
      json = { "prettier" },
      sh = { "shfmt" },
    },
  },
}
