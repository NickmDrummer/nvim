return {
  -- Evitar que Mason reinstale haskell-language-server
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "haskell-language-server"
      end, opts.ensure_installed or {})
    end,
  },

  -- Que lspconfig no intente arrancar hls
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        hls = function()
          return true -- no arrancar
        end,
      },
      servers = {
        hls = {
          mason = false,
        },
      },
    },
  },

  -- Configuración correcta de haskell-tools (con init, no opts)
  {
    "mrcjkb/haskell-tools.nvim",
    init = function()
      ---@type haskell-tools.Opts
      vim.g.haskell_tools = {
        hls = {
          -- Opcional: solo si quieres forzar el binario explícitamente
          -- cmd = { "haskell-language-server-wrapper", "--lsp" },
        },
      }
    end,
  },
}
