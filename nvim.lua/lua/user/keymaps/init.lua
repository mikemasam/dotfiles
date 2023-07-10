
vim.cmd([[
let mapleader=";"
let maplocalleader=";"

" Git
nnoremap <space>gs :Git<CR>
nnoremap <space>gc :Git commit -v -q<CR>
nnoremap q <c-v>
nnoremap <space>gd :Gdiff<CR>
" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap ff <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

:imap ii <Esc>


nmap <space> :
vmap <space> <Esc>

imap jj <ESC>
imap kk <ESC>
imap jk <ESC>
" nnoremap <Leader>j <C-d>
" nnoremap <Leader>k <C-u>
nmap <Leader>h :windo wincmd H<CR>
" open NvimTreeOpen
nnoremap <C-o> :NvimTreeOpen<CR>
nnoremap <C-s> :SymbolsOutline<CR>
" close current buffer
nnoremap qq :bd<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>


]])

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local function noremap(shortcut, command)
  keymap("n", shortcut, command, { noremap = true, silent = true })
end

-- " LSP config (the mappings used in the default file don't quite work right)
noremap("<silent> gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
noremap("<silent> gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
noremap("<silent> gr", "<cmd>lua vim.lsp.buf.references()<CR>")
noremap("<silent> gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
noremap("<silent> K", "<cmd>lua vim.lsp.buf.hover()<CR>")
noremap("<silent> <C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
noremap("<silent> <C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
noremap("<silent> <C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
