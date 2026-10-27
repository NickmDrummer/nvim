-- blink.cmp customizations on top of the official LazyVim "coding.blink"
-- extra (declared in lazyvim.json). Only personal styling and the
-- render-markdown source live here; keymaps, snippets and cmdline settings
-- come from the extra.
return {
  "saghen/blink.cmp",
  opts = {
    appearance = {
      -- keep the nvim-cmp highlight fallback the extra turned off; mfd.nvim
      -- has no native blink integration yet
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },
    completion = {
      menu = { border = "rounded" },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = { border = "rounded" },
      },
    },
    signature = {
      window = { winblend = 1 },
    },
    sources = {
      -- merged with the extra's { "lsp", "path", "snippets", "buffer" }
      -- through sources.default opts_extend
      default = { "markdown" },
      providers = {
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
