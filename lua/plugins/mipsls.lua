return {
  "neovim/nvim-lspconfig",
  opts = {},
  config = function()
    vim.lsp.config("mipsls", {
      cmd = { "mips-language-server" },
      filetypes = { "asm" },
      root_markers = { ".git" },
      settings = { mipsls = { dialect = "Mars", version = "Mips I" } },
    })
    vim.lsp.enable("mipsls")
  end,
}
