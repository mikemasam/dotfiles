return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  opts = function()
    return {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
        },
      },
    }
  end,
}
