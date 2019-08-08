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
Plugin 'rdnetto/YCM-Generator', { 'branch': 'stable'}
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
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'junegunn/goyo.vim'

" Languages
Plugin 'ternjs/tern_for_vim'
Plugin 'fatih/vim-go'
Plugin 'buoto/gotests-vim'
Plugin 'previm/previm'

" Colors
Plugin 'andreypopp/vim-colors-plain'
Plugin 'jnurmine/Zenburn'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required

call glaive#Install()

filetype plugin indent on    " required

" Colors
"colo zenburn
set background=dark
colo plain

" new leader
let mapleader = ","
let maplocalleader = ","

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

" Search under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Jump between errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" common indent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ---------------------------------- "
" Configure python
" ---------------------------------- "
function! VimPythonSetup()
	autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
	autocmd BufNewFile,BufRead *.py setlocal autoindent fileformat=unix encoding=utf-8
	au FileType python nmap <leader>r :!python %<CR>
	let python_highlight_all=1
endfunction
call VimPythonSetup()


" ---------------------------------- "
" Configure javascript, js
" ---------------------------------- "
" js, javascript, html, css
au BufNewFile,BufRead *.js,*.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent
au FileType javascript nmap <leader>r :!node %<CR>

" ---------------------------------- "
" Configure yaml
" ---------------------------------- "
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" ---------------------------------- "
" Configure go, golang, GO
" ---------------------------------- "
function! VimGoSetup()
	" vim-go related mappings
	autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
	" Splits
	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
	" go plugin functions
	au FileType go nmap <Leader>r <Plug>(go-run)
	au FileType go nmap <Leader>b <Plug>(go-build)
	au FileType go nmap <Leader>t <Plug>(go-test)
	au FileType go nmap <Leader>tf <Plug>(go-test-func)
	au FileType go nmap <Leader>i <Plug>(go-info)
	au FileType go nmap <Leader>s <Plug>(go-implements)
	au FileType go nmap <Leader>c <Plug>(go-coverage)
	au FileType go nmap <Leader>cl <Plug>(go-coverage-clear)
	au FileType go nmap <Leader>e <Plug>(go-rename)
	au FileType go nmap <Leader>gi <Plug>(go-imports)
	au FileType go nmap <Leader>gI <Plug>(go-install)
	au FileType go nmap <Leader>gd <Plug>(go-doc)
	au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
	au FileType go nmap <Leader>ds <Plug>(go-def-split)
	au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
	au FileType go nmap <Leader>dt <Plug>(go-def-tab)
	let g:go_auto_type_info = 1
	let g:go_fmt_command = "gofmt"
	let g:go_fmt_experimental = 1
	let g:go_dispatch_enabled = 0 " vim-dispatch needed
	let g:go_list_type = "quickfix"
	let g:go_metalinter_autosave = 1
	let g:go_metalinter_autosave_enabled = ['vet', 'golint']
	let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
	let g:go_term_enabled = 0
	let g:go_term_mode = "vertical"
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_structs = 1
	let g:go_highlight_interfaces = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_extra_types = 1
	let g:go_highlight_build_constraints = 1
	let g:go_highlight_chan_whitespace_error = 1
endfunction
call VimGoSetup()

" ---------------------------------- "
" Configure cpp c++
" ---------------------------------- "
function! CppSetup()
	let &path.="src/include,/usr/include/AL,"
	autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType cpp nmap <leader>r :!g++ % && ./a.out<CR>
endfunction
call CppSetup()

" ---------------------------------- "
" Configure Markdown, md, markdown
" ---------------------------------- "
let g:previm_open_cmd = 'google-chrome'

" ---------------------------------- "
" Configure YouCompleteMe and Snippets
" ---------------------------------- "
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-J>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-K>', '<Up>']
" Goto definition with F3
"map <F3> :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set completeopt-=preview


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
"map  <Leader><Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

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
" Configure codefmt
" ---------------------------------- "
augroup autoformat_settings
	"autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
	"autocmd FileType dart AutoFormatBuffer dartfmt
	autocmd FileType go AutoFormatBuffer gofmt
	"autocmd FileType gn AutoFormatBuffer gn
	"autocmd FileType html,css,json AutoFormatBuffer js-beautify
	"autocmd FileType java AutoFormatBuffer google-java-format
	"autocmd FileType python AutoFormatBuffer yapf
	" Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" ---------------------------------- "
" Configure ALE
" ---------------------------------- "
let g:ale_completion_enabled = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_echo_cursor = 0

augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 1
" python checkers
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = 'python'
let g:ale_python_pylint_options = '-m pylint'


" ---------------------------------- "
" Configure NERDTree
" ---------------------------------- "
" Window Width
" Hide .pyc in NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', 'venv']

" Toggle NERDTree
nmap <F6> :NERDTreeToggle<CR>

" Toggle TagBar (ctags)
nmap <F8> :TagbarToggle<CR>

" Remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
