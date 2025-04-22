return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      templ = {
        cmd = { "templ", "lsp" },
        filetypes = { "templ" },
        root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
      },
    },
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,
    },
  },
}
