" setup Vundle
set autowrite
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

" Common plugins
Bundle 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'christoomey/vim-tmux-navigator'

" Editing
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Languages
Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/goyo.vim'
Plugin 'fatih/vim-go'
Plugin 'buoto/gotests-vim'
Plugin 'chrisbra/csv.vim'

" Colors
Plugin 'rafi/awesome-vim-colorschemes'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Colors
set termguicolors
colo deus


"augroup CursorLine
  "au!
  "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  "au WinLeave * setlocal nocursorline
"augroup END

" new leader
let mapleader = ","

" scroll offset
set scrolloff=15

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

" Search under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Jump between errors
map <C-n> :lnext<CR>
map <C-m> :lprevious<CR>
nnoremap <leader>a :lclose<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" common tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab



" ---------------------------------- "
" Configure python
" ---------------------------------- "
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix |
      \ set encoding=utf-8

" Configure YAPF, google python formater
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%,1)<cr>
let python_highlight_all=1



" ---------------------------------- "
" Configure javascript, js
" ---------------------------------- "
" js, javascript, html, css
au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |
      \ set expandtab |
      \ set autoindent



" ---------------------------------- "
" Configure go, golang
" ---------------------------------- "

" navigate between errors
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" mappings
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>tf  <Plug>(go-test-func)
autocmd FileType go nmap <Leader>i  <Plug>(go-info)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)


" Info in status bar
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
set updatetime=100

" Highlights
let g:go_highlight_types = 1
let g:go_highlight_fields = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 0
let g:go_highlight_operators = 0

" Splits
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"


" highlight BadWhitespace
highlight BadWhitespace ctermbg=blue guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" ---------------------------------- "
" Configure YouCompleteMe
" ---------------------------------- "
set completeopt-=preview
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
" <Leader>f{char} to move to {char}
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

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
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_echo_cursor = 0

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" python checkers
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = 'python'
let g:ale_python_pylint_options = '-m pylint'


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
"set nu

"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"
" Remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
