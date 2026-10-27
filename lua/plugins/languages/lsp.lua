-- Language servers configured through LazyVim's lspconfig hooks
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = { gofumpt = true },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },

  -- MARS MIPS language server: custom binary, not available through Mason.
  -- Registered against Neovim's built-in `vim.lsp.config` from `init` so it
  -- never clashes with LazyVim's own lspconfig `config`.
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.lsp.config("mipsls", {
        cmd = { "mips-language-server" },
        filetypes = { "asm" },
        root_markers = { ".git" },
        settings = { mipsls = { dialect = "Mars", version = "Mips I" } },
      })
      vim.lsp.enable("mipsls")
    end,
  },
}
