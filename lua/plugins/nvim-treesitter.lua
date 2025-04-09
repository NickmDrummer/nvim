return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c", "cpp", "lua", "go", "markdown", "haskell", "json" } },
    indent = {
      enable = true,
      -- disable = { "yaml" }
    },
  },
}
