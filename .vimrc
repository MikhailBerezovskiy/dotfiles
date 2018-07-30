" setup Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'junegunn/goyo.vim'
Plugin 'fatih/vim-go'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme zenburn
"let g:solarized_termcolors=256
"set background=light
"colorscheme solarized

set termguicolors
set background=dark
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 15
colorscheme nord


" scroll offset
set scrolloff=20

" Toggle Disgraction free (Goyo)
nnoremap <Leader>W :Goyo<CR>


"---------------------------------
"------Navigation and panes------
"---------------------------------
" split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" CursorLine highlight
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Search under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


" Jump between errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See Dockstring in folded preview
let g:SimpylFold_docstring_preview=1

" common tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix |
      \ nnoremap <buffer> <F9> :exec '!python3' shellescape(@%,1)<cr> |

autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |
      \ set expandtab |
      \ set autoindent |

" Golang run and build
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" highlight BadWhitespace
highlight BadWhitespace ctermbg=blue guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Setup Unicode for Python3
set encoding=utf-8

" Python code hightligh
let python_highlight_all=1


" ---------------------------------- "
" Configure YouCompleteMe
" ---------------------------------- "
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


let g:ycm_key_list_select_completion = ['<C-J>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-K>', '<Up>']

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" ---------------------------------- "
" Configure Easymotion
" ---------------------------------- "
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" ---------------------------------- "
" Configure CTRLP
" ---------------------------------- "
set runtimepath^=~/.vim/bundle/ctrlp.vim
"" the nearest ancestor or files : .git .hg etc
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }


" ---------------------------------- "
" Configure ALE
" ---------------------------------- "
"let g:ale_open_list = 1
let g:ale_fix_on_save = 1


" ---------------------------------- "
" Configure NERDTree
" ---------------------------------- "
" Window Width
"let g:NERDTreeWinSize=40
" Hide .pyc in NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', 'venv']

" Toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" Toggle TagBar (ctags)
nmap <F8> :TagbarToggle<CR>

" Lines numbers
set nu

"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"
" Remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
