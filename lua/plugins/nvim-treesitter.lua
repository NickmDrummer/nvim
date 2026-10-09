return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c", "cpp", "lua", "go", "markdown", "json", "templ", "asm" } },
    indent = {
      enable = true,
      -- disable = { "yaml" }
    },
  },
}
