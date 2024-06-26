local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"
  use "christianchiarulli/lua-dev.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ray-x/lsp_signature.nvim"
-- use "b0o/SchemaStore.nvim" -- probably useless 

  use "RRethy/vim-illuminate"
  use { "j-hui/fidget.nvim", tag = "legacy" }
  use "lvimuser/lsp-inlayhints.nvim"
  -- use "simrat39/inlay-hints.nvim"
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

  -- Completion
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-omni"

  -- Snippet
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/playground"
  -- use "windwp/nvim-ts-autotag"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "kylechui/nvim-surround"

  -- Marks
  use "christianchiarulli/harpoon"
  use "MattesGroeger/vim-bookmarks"

  -- Fuzzy Finder/Telescope  , tag = "0.1.1"
  use { "nvim-telescope/telescope.nvim" }
  use "nvim-telescope/telescope-media-files.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  -- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  -- Color
  use "NvChad/nvim-colorizer.lua"
  use "nvim-colortils/colortils.nvim"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- If you are using Packer
  use "shaunsingh/solarized.nvim"
  use "rose-pine/neovim"
  use "rebelot/kanagawa.nvim"
  use "whatyouhide/vim-gotham"
  use "sam4llis/nvim-tundra"
  -- use "lunarvim/colorschemes"

  -- Utility
  use "rcarriga/nvim-notify"
  use "stevearc/dressing.nvim"
  use "ghillb/cybu.nvim"
  use "moll/vim-bbye"
  use "lalitmee/browse.nvim"

  -- Registers
  use "tversteeg/registers.nvim"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Startup
  use "goolord/alpha-nvim"

  -- Indent
  -- use "lukas-reineke/indent-blankline.nvim"

  -- File Explorer
  -- use "kyazdani42/nvim-tree.lua"

  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  }

  use "christianchiarulli/lir.nvim"

  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"
  --[[ use "B4mbus/todo-comments.nvim" ]]

  -- Project
  use "ahmedkhalf/project.nvim"

  -- Quickfix
  use "kevinhwang91/nvim-bqf"

  -- Code Runner
  use "is0n/jaq-nvim"
  use { "0x100101/lab.nvim", run = "cd js && npm ci" }

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"

  -- Github
  use "pwntester/octo.nvim"

  -- Editing Support
  -- use "windwp/nvim-autopairs"
  use "nacro90/numb.nvim"
--  use "andymass/vim-matchup" -- useless
  use "karb94/neoscroll.nvim"
  use "junegunn/vim-slash"

  -- Motion
  use "phaazon/hop.nvim"

  -- Keybinding
  use "folke/which-key.nvim"

  -- Java
  use "mfussenegger/nvim-jdtls"

  -- Rust
  use { "christianchiarulli/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }
  use "saecki/crates.nvim"

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  use "jose-elias-alvarez/typescript.nvim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    cmd = { "MarkdownPreview" },
  }

  use "metakirby5/codi.vim"
  use "filipdutescu/renamer.nvim"
  use { "christianchiarulli/nvim-gps", branch = "text_hl" }

  -- formatter
  use "mhartington/formatter.nvim"

  -- php
  use "adoy/vim-php-refactoring-toolbox"
  use "stephpy/vim-php-cs-fixer"
  use "gpanders/editorconfig.nvim"

  -- elixir
--  use { "elixir-lang/vim-elixir", ft = "elixir" }
--  use { "mattreduce/vim-mix", ft = "elixir" }
--  -- use { "slashmili/alchemist.vim", ft = "elixir" }
--  use { "mhanberg/elixir.nvim", requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } }

  -- ruby & rails
  -- use "tpope/vim-rails"
  --   use "vim-ruby/vim-ruby"

  -- yaml
  use { "cuducos/yaml.nvim", ft = { "yaml" }, requires = { "nvim-treesitter/nvim-treesitter" } }

  use "tpope/vim-fugitive"
  use "mattn/emmet-vim"
  use "tpope/vim-surround"
  use "tpope/vim-dispatch"
--  use "godlygeek/tabular"
  -- use "Townk/vim-autoclose"
  use "machakann/vim-highlightedyank"
  use "terryma/vim-multiple-cursors"
  use "tommcdo/vim-exchange"

  -- protocol buffers
  use "prabirshrestha/vim-lsp"

  -- flutter tools
  --   use { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" }
  -- use "dart-lang/dart-vim-plugin"

  -- restore the cursor position
  use { "farmergreg/vim-lastplace" }

  -- vim prisma
  use "pantharshit00/vim-prisma" -- Prisma ORM

  -- wakatime for tracking my working hrs
  -- use "wakatime/vim-wakatime"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end

  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  use { 'dstein64/vim-startuptime' }
end)
