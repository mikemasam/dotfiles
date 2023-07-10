-- vim.schedule(function()
--   vim.cmd([[
--    set clipboard=unnamed
--   ]])
-- end);

vim.opt.termguicolors = true
vim.opt.completeopt  = { "menuone", "noselect" } -- cmp option
vim.cmd([[
" set nocompatible              " be iMproved, required
if has('termguicolors')
set termguicolors
endif
let g:loaded_matchparen = 0
let loaded_matchparen = 0
"filetype off
set ttyfast
let mapleader=";"
let maplocalleader=";"
set mouse=
"set guicursor=n-v-c-ve:ver25,i-ci:block
set guicursor=a:ver25,a:blinkon0
"-ve:block
",r-cr:hor20,o:hor50


" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"nmap <space>] :TagbarToggle<CR>
" fugitive git bindings
"nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Git<CR>
nnoremap <space>gc :Git commit -v -q<CR>
nnoremap q <c-v>
"nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
"nnoremap <space>ge :Gedit<CR>
"nnoremap <space>gr :Gread<CR>
"nnoremap <space>gw :Gwrite<CR><CR>
"nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
"nnoremap <space>gp :Ggrep<Space>
"nnoremap <space>gm :Gmove<Space>
"nnoremap <space>gb :Git branch<Space>
"nnoremap <space>go :Git checkout<Space>
"nnoremap <space>gps :silent Gpush<CR>
"nnoremap <space>gpl :silent Gpull<CR>
"let g:gitgutter_highlight_lines = 1
set signcolumn=yes
let g:gitgutter_max_signs = 1500


" let $FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
" "fzf
" let g:fzf_action = {
" \ 'ctrl-t': 'tab split',
" \ 'ctrl-x': 'split',
" \ 'ctrl-v': 'vsplit' }
" let g:fzf_preview_window = ['right,50%', 'ctrl-/']
" "file grep
" nnoremap ff :Ag<CR>
" "buffer list
" nmap <leader>b :Buffers<CR>
" " all files
" nnoremap <C-p> :Files<CR>
" nnoremap <leader>f :Files<CR>
" " git added files
" nnoremap <leader>g :GFiles<CR>
" " git changed files
" nnoremap <leader>s :GFiles?<CR>

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap ff <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>r :lua require('rest-nvim').run()<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Remap ESC to ii
:imap ii <Esc>

"set shortmess+=c
" set filetypes as typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

"GT to move between open file
set backupcopy=yes
set autoread
set incsearch
" set nobackup
" set nowritebackup
set showmatch
set expandtab
set autoindent
set showmatch
set hlsearch
set smartindent
set incsearch
syntax on
set lazyredraw
set wildignorecase
" set t_Co=256
set laststatus=2

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set showmatch
set hlsearch
set smartindent

set relativenumber
"set cursorline
set nocursorline
set nocursorcolumn
"set synmaxcol=220
set number

"make sure the airline status shows even on single files
set laststatus=2
filetype indent on
filetype plugin indent on

"disable ctrlp caching
" let g:ctrlp_use_caching = 0

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

"let g:airline_theme='onedark'
"let g:airline_section_b='' "git branch + changes
"let g:airline_section_y='' "filetype
"let g:airline_section_warning=''
set background=dark
"set background=light
"colorscheme onedark
colorscheme nightfox
"colorscheme duskfox
"colorscheme PaperColor
"colorscheme dracula


imap jj <ESC>
imap kk <ESC>
imap jk <ESC>
nnoremap <Leader>j <C-d>
nnoremap <Leader>k <C-u>
nmap <Leader>h :windo wincmd H<CR>
" open NvimTreeOpen
nnoremap <C-o> :NvimTreeOpen<CR>
nnoremap <C-s> :SymbolsOutline<CR>
" close current buffer
nnoremap qq :bd<CR>
" write current buffer
" imap ww :w<CR>

"mult terminal copy paste
" set clipboard=unnamed

" 'quote' a word
nmap qg :silent! normal mpea`<Esc>bi`<Esc>`pl
" " "double" "quote" a word
nmap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
nmap dq :silent! normal mpea"<Esc>bi"<Esc>`pl
" " remove quotes from a word
nmap qr :silent! normal mpeld bhd `ph<CR>
"format to json
"nmap <Leader>jf :%!python -m json.tool<CR>
"Tabulize
"nmap <Leader>t <Esc>:Tabularize/
"nmap <TAB> <C-w>

"imap <TAB> <C-w>

"do the actual deleting
" nnoremap <leader>d "_d
" vnoremap <leader>d "_d
" vnoremap <leader>p "_dP
" nnoremap <Leader>e :bnext<CR>
" nnoremap <Leader>w :bprevious<CR>


nmap <space> :
vmap <space> <Esc>
"execute pathogen#infect()


" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
let g:tmuxline_powerline_separators = 0




" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
]]);
