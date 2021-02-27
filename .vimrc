set nocompatible              " be iMproved, required

let mapleader=","
let maplocalleader=","

call plug#begin("~/.vim/plugged")

Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-pathogen'
Plug 'christoomey/vim-tmux-navigator'
Plug 'elzr/vim-json'
Plug 'yggdroot/indentline'
Plug 'edkolev/tmuxline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sbdchd/neoformat'
Plug 'kien/ctrlp.vim'
Plug 'blueyed/vim-diminactive'
Plug 'mikemasam/vim-hsftp'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-conflicted'
Plug 'StanAngeloff/php.vim'
Plug 'eugen0329/vim-esearch'
"Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-buftabline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

nmap <space>] :TagbarToggle<CR>
nmap <space>fu :!scp % acex1@41.59.225.221:/var/www/html/%
" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :silent Gpush<CR>
nnoremap <space>gpl :silent Gpull<CR>
nmap <leader>bf :Buffers<CR>
"let g:gitgutter_highlight_lines = 1
"let g:NERDTreeShowIgnoredStatus = 1
set signcolumn=yes
let g:gitgutter_max_signs = 1500
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "m",
            \ "Staged"    : "+",
            \ "Untracked" : "~",
            \ "Renamed"   : "r",
            \ "Unmerged"  : "-",
            \ "Deleted"   : "d",
            \ "Dirty"     : "x",
            \ "Clean"     : "^",
            \ 'Ignored'   : '!',
            \ "Unknown"   : "?"
            \ }

"let g:NERDTreeDirArrowExpandable = '>'
"let g:NERDTreeDirArrowCollapsible = '^'
nnoremap <Leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeShowLineNumbers=1
"let NERDTreeShowHidden=1
"let NERDTreeMinimalUI = 0



 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Remap Keys
 " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " "Remap ESC to ii
 :imap ii <Esc>


"let g:airline#extensions#ale#enabled = 1
let g:syntastic_php_checkers = ['phpmd', 'php']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_php_phpcs_args = "--standard=psr2"
let g:syntastic_php_phpmd_exec = './bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'

"let g:phpcomplete_relax_static_constraint = 1
"let g:phpcomplete_complete_for_unknown_classes = 1
"let g:phpcomplete_parse_docblock_comments = 1
"let g:phpcomplete_cache_taglists = 1
"let g:phpcomplete_enhance_jump_to_definition = 1
"set completeopt=noinsert,menuone,noselect

"For YCM
"setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
"
"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
"let g:phpcomplete_index_composer_command = "composer"

"For PHP Autocompilation
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:autotagTagsFile=".git/tags"
"let g:autotagDisabled=1
let g:gutentags_cache_dir="~/work/tmp"
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:ctrlp_custom_ignore = 'node_modules\|bower_compnents\|DS_Store\|git'
let g:ctrlp_max_files = 0
" Search with ctrl+p from current directory instead of project root
let g:ctrlp_working_path_mode = 0

"let g:EditorConfig_core_mode = 'external_command'
"set completeopt-=preview
"set completeopt+=menu,menuone,noinsert,noselect
"set shortmess+=c
let g:javascript_plugin_flow = 1

"GT to move between open file
set backupcopy=yes
set autoread
set incsearch
set nobackup
set nowritebackup
set showmatch
set expandtab
set autoindent
set showmatch
set hlsearch
set smartindent
set incsearch
syntax on
set cursorline
set number
set lazyredraw
set wildignorecase
set t_Co=256
set laststatus=2

set ts=2 sts=2 noet
set shiftwidth=2
set expandtab
set autoindent
set showmatch
set hlsearch
set smartindent

set nocursorline
"make sure the airline status shows even on single files
set laststatus=2
set directory=~/.vim/swap/

filetype indent on
filetype plugin indent on

"set synmaxcol=120
"disable ctrlp caching
let g:ctrlp_use_caching = 0

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap ff :Ag<CR>

"set background=light
"autocmd vimenter * NERDTree
syntax enable
set background=dark
colorscheme onedark
imap jj <ESC>
imap kk <ESC>
imap jk <ESC>
nmap <Leader>h :windo wincmd H<CR>

"mult terminal copy paste
set clipboard=unnamed

" 'quote' a word
nmap qg :silent! normal mpea`<Esc>bi`<Esc>`pl
" " double "quote" a word
nmap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
nmap dq :silent! normal mpea"<Esc>bi"<Esc>`pl
" " remove quotes from a word
nmap qr :silent! normal mpeld bhd `ph<CR>
nmap <Leader>jf :%!python -m json.tool<CR>
"Tabulize
nmap <Leader>t <Esc>:Tabularize/
"nmap <TAB> <C-w>

"imap <TAB> <C-w>

"do the actual deleting
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP
nnoremap <Leader>e :bnext<CR>
nnoremap <Leader>w :bprevious<CR>

nmap <space> :
vmap <space> <Esc>
execute pathogen#infect()


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
let g:syntastic_go_checkers = ["gofmt","go", "govet", "errcheck"]


set directory^=$HOME/.vim/swaps//


" Uncomment the following to have Vim jump to the last position when
" " reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
