local status_ok, lab = pcall(require, "lab")
if not status_ok then
  print "Lab plugin not found"
  return
end

lab.setup {
  code_runner = {
    enabled = true,
  },
  quick_data = {
    enabled = true,
  },
}

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>1", ":Lab code run<cr>", opts)
keymap("n", "<leader>11", ":Lab code stop<cr>", opts)
keymap("n", "<m-6>", ":Lab code panel<cr>", opts)


-- local function noremap(shortcut, command)
--   keymap("n", shortcut, command, { noremap = true, silent = true })
-- end
-- noremap("<silent> gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
