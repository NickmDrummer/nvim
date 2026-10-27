-- Treesitter parsers (merged with LazyVim defaults and language extras)
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "cpp", "lua", "go", "markdown", "json", "asm" },
  },
}
