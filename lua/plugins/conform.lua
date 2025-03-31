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
            html = { "prettier" },
            markdown = { "prettier" },
            sh = { "shfmt" },
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
    },
}
