vim.cmd([[
let mapleader=";"
let maplocalleader=";"

imap jj <ESC>
imap kk <ESC>
imap jk <ESC>

nmap <space> :
vmap <space> <Esc>

imap ii <Esc>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>
nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

]])
