syntax on

set nocompatible
set noerrorbells
set cursorline
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set hidden
set colorcolumn=80

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
highlight ColorColumn ctermbg=0

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
"Plug 'alvan/vim-closetag'
Plug 'jremmen/vim-ripgrep'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
"Plug 'Valloric/YouCompleteMe', {'do': './install.py --tern-completer'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

let NERDTreeShowBookmarks=1
let NERDTreeMapOpenInTab='<ENTER>'


" CoC extensions
let g:coc_global_extensions = [
\ 'coc-go',
\ 'coc-json',
\ 'coc-tsserver',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml'
\ ]

" Use <Tab> and <S-Tab> to navigate the completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


colorscheme gruvbox
set background=dark
set t_Co=256

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=" "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_use_caching = 0

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_def_mapping_enabled = 0

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

imap jj <Esc>

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>= :wincmd =<CR>
noremap <leader>u :UndotreeShow<CR>
noremap <leader>x :bp<cr>:bd #<cr>
noremap <silent><leader>pv :NERDTreeFind<CR>
noremap <silent> pt :NERDTreeToggle<Enter>

" clear highlighting after search
nnoremap <C-l> :nohl<CR><C-L>

noremap <leader>ps :Rg<SPACE>
noremap <silent> <leader>+ :vertical resize +5<CR>
noremap <silent> <leader>- :vertical resize -5<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"nmap <silent> gf  <Plug>(coc-fix-current)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
"
" YCM
" The best part
"noremap <silent> <leader>gd :YcmCompleter GoTo<CR>
"noremap <silent> <leader>gf :YcmCompleter FixIt<CR>
"noremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>
"noremap <silent> <leader>gp :YcmCompleter Fix<CR>
"let g:ycm_filepath_blacklist = {}

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
