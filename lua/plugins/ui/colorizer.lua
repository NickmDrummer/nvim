-- Live color previews for hex codes and named colors
return {
  "norcalli/nvim-colorizer.lua",
  lazy = false,
  config = function()
    require("colorizer").setup()
  end,
}
