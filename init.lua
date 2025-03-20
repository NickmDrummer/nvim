-- forcing block cursor
vim.opt.guicursor = "n-v-c-i:block"
vim.o.timeoutlen = 2000
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
