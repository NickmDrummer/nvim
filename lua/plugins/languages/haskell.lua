return {
  -- Keep Mason from reinstalling haskell-language-server
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "haskell-language-server"
      end, opts.ensure_installed or {})
    end,
  },

  -- Make lspconfig not start hls (haskell-tools.nvim manages it instead)
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        hls = function()
          return true -- do not start
        end,
      },
      servers = {
        hls = {
          mason = false,
        },
      },
    },
  },

  -- Proper haskell-tools setup (via init, not opts)
  {
    "mrcjkb/haskell-tools.nvim",
    init = function()
      ---@type haskell-tools.Opts
      vim.g.haskell_tools = {
        hls = {
          -- Optional: only to force the binary explicitly
          -- cmd = { "haskell-language-server-wrapper", "--lsp" },
        },
      }
    end,
  },
}
