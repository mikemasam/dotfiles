-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  -- plugin manager
  use 'wbthomason/packer.nvim'
  -- theme 
  use 'EdenEast/nightfox.nvim' 
  -- git utils 
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  -- visual
  use 'yggdroot/indentline'
  -- tmux
  use 'edkolev/tmuxline.vim'
  use 'christoomey/vim-tmux-navigator'
  -- cursor manager
  use 'terryma/vim-multiple-cursors'
  -- editor specific config loader .editorconfig
  use 'editorconfig/editorconfig-vim'
  -- buffer top line
  use 'ap/vim-buftabline'

  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use 'junegunn/fzf.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'dstein64/vim-startuptime'
  use 'karb94/neoscroll.nvim'

  -- Nvim LSP
  -- use 'neovim/nvim-lspconfig'

end)
