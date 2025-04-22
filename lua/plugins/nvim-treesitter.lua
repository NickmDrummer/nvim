return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c", "cpp", "lua", "go", "markdown", "json", "templ" } },
    indent = {
      enable = true,
      -- disable = { "yaml" }
    },
  },
}
