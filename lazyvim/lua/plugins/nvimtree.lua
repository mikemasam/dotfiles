return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = { custom = { "^.git$", "^/node_modules$" } },
      renderer = {
        group_empty = true,
      },
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 70,
            height = 50,
            row = 1,
            col = 1,
          },
        },
      },
    })
  end,
}
