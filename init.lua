-- forcing block cursor
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.clipboard = "unnamedplus" -- Keep normal yanks in the Wayland clipboard
vim.o.timeoutlen = 2000
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard = "unnamedplus" -- Final setting after LazyVim startup
