-- require('packers/all')
-- require('packers/setup')
-- require('packers/neoscroll')
-- require('packers/lsp')
-- require('packers/lualine')


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
  -- use 'editorconfig/editorconfig-vim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'dstein64/vim-startuptime'
  use 'karb94/neoscroll.nvim'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}


  -- use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  -- use 'junegunn/fzf.vim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Nvim LSP
  use 'neovim/nvim-lspconfig'
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
  use "SmiteshP/nvim-navic"
  use "simrat39/symbols-outline.nvim"
  use "b0o/SchemaStore.nvim"

  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  use "lvimuser/lsp-inlayhints.nvim"

   -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- formatter
  use "mhartington/formatter.nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Completion
  use "christianchiarulli/nvim-cmp"
  -- use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"


  use('MunifTanjim/prettier.nvim')

  -- SNippet
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  -- use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "kylechui/nvim-surround"

  use "NvChad/nvim-colorizer.lua"
  use "nvim-colortils/colortils.nvim"

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  use "ghillb/cybu.nvim"
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"
  use "lalitmee/browse.nvim"

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  }

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- php
  use "adoy/vim-php-refactoring-toolbox"
  use "stephpy/vim-php-cs-fixer"
  use "gpanders/editorconfig.nvim"

  -- yaml
  use { "cuducos/yaml.nvim", ft = { "yaml" }, requires = { "nvim-treesitter/nvim-treesitter" } }

  -- protocol buffers
  use "prabirshrestha/vim-lsp"

  -- restore the cursor position
  use { "farmergreg/vim-lastplace" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
--  if PACKER_BOOTSTRAP then
--    require("packer").sync()
--  end
end)

