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
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
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
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'jnurmine/Zenburn'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"colorscheme zenburn
let g:solarized_termcolors=256
set background=light
colorscheme solarized


" scroll offset
set scrolloff=15



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
      \ TagbarOpen

au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |
      \ set expandtab |
      \ set autoindent |


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

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

let g:ycm_key_list_select_completion = ['<C-J>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-K>', '<Up>']

" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_python_binary_path = '/usr/bin/python3'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>



" ---------------------------------- "
" Configure Syntastic
" ---------------------------------- "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_pyflakes_exe = 'python3 -m pyflakes'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" ---------------------------------- "
" Configure Easymotion
" ---------------------------------- "
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

hi EasyMotionTarget ctermbg=none ctermfg=darkgreen
hi EasyMotionShade  ctermbg=none ctermfg=lightgrey

hi EasyMotionTarget2First ctermbg=none ctermfg=darkblue
hi EasyMotionTarget2Second ctermbg=none ctermfg=blue


" ---------------------------------- "
" Configure CTRLP
" ---------------------------------- "
set runtimepath^=~/.vim/bundle/ctrlp.vim
"" the nearest ancestor or files : .git .hg etc
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }



" ---------------------------------- "
" Configure NERDTree
" ---------------------------------- "
" Window Width
let g:NERDTreeWinSize=40
" Hide .pyc in NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']

" Toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" Toggle TagBar (ctags)
nmap <F8> :TagbarToggle<CR>

" Lines numbers
set nu

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufWritePre * %s/\s\+$//e
