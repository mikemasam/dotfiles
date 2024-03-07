-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

map("i", "jj", "<esc>")
map("i", "jk", "<esc>")
map("n", "<space>", ":")

map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "ff", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>b", "<cmd>Telescope buffers<CR>")
map("n", "<Tab>", "<cmd>:bnext<CR>")
map("n", "<S-Tab>", "<cmd>:bprev<CR>")
map("n", "qq", "<cmd>:exit<CR>")

map("n", "<space>gs", "<cmd>:Git<CR>")
map("n", "<space>gc", "<cmd>:Git commit -v -q<CR>")
map("n", "<space>gd", "<cmd>:Gdiff<CR>")

-- map("n", "<C-o>", "<cmd>:NvimTreeOpen<CR>")
map("n", "<C-o>", "<cmd>:NvimTreeFindFile<CR>")

-- local opts = { noremap = true, silent = true }
-- map("n", "<C-j>", "<Down>", opts)
-- map("n", "<C-k>", "<Up>", opts)
