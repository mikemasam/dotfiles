-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ";"
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`
vim.g.autoformat = false 
vim.opt.smartindent = false
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "white" })
