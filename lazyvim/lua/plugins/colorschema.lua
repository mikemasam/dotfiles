return {
  { "shaunsingh/solarized.nvim" },
  { "rose-pine/neovim" },
  { "rebelot/kanagawa.nvim" },
  { "whatyouhide/vim-gotham" },
  { "lunarvim/colorschemes" },
  { "sam4llis/nvim-tundra" },
  { "Mofiqul/vscode.nvim" },
  { "lunarvim/onedarker.nvim" },
  { "lunarvim/darkplus.nvim" },
  { "lunarvim/colorschemes" },
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  -- Configure LazyVim to load default colorscheme 
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darkplus",
    },
  },
}
