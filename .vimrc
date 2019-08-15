"--------------------------------------------------
" Plugins List
"--------------------------------------------------
filetype off	" required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" List start
" Common plugins
Bundle 'valloric/youcompleteme'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Navigation
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
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
" List End
call vundle#end()            " required
call glaive#Install()
filetype plugin indent on    " required

"--------------------------------------------------
" General
"--------------------------------------------------
set history=500
filetype plugin on
filetype indent on
let mapleader = ","
let maplocalleader = ","

"--------------------------------------------------
" User Interface
"--------------------------------------------------
set scrolloff=15
set wildignore+=/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
"mac settings
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif
"mac settings end

"--------------------------------------------------
" Colors and Fonts
"--------------------------------------------------
syntax on
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
"colo zenburn
set background=dark
colo plain

"--------------------------------------------------
" Files, Backups, Undo
"--------------------------------------------------
set autoread
set nobackup
set nowb
set noswapfile

"--------------------------------------------------
" Tabs and Indents
"--------------------------------------------------
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set autoindent
set smartindent
set wrap

"--------------------------------------------------
" Navigation and Panes
"--------------------------------------------------
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"--------------------------------------------------
" Errors Quickfix
"--------------------------------------------------
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" put quick buffer bellow
augroup DragQuickfixWindowDown
	autocmd!
	autocmd FileType qf wincmd J
augroup end
" close quick buffer on empty
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"--------------------------------------------------
" Python
"--------------------------------------------------
function! VimPythonSetup()
	autocmd BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
	autocmd BufNewFile,BufRead *.py setlocal autoindent fileformat=unix encoding=utf-8
	au FileType python nmap <leader>r :!python %<CR>
	autocmd BufWritePre * %s/\s\+$//e " remove trailing spaces
	let python_highlight_all=1
endfunction
call VimPythonSetup()

"--------------------------------------------------
" Javascript js
"--------------------------------------------------
au BufNewFile,BufRead *.js,*.html,*.css setlocal tabstop=2 softtabstop=2 shiftwidth=2 autoindent
au FileType javascript nmap <leader>r :!node %<CR>

"--------------------------------------------------
" Yaml
"--------------------------------------------------
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"--------------------------------------------------
" GO golang
"--------------------------------------------------
function! VimGoSetup()
	let g:go_def_mode='gopls'
	let g:go_info_mode='gopls'
	autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
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

"--------------------------------------------------
" C++ cpp
"--------------------------------------------------
function! CppSetup()
	let &path.="src/include,/usr/include/,"
	autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
	autocmd FileType cpp nmap <leader>r :!g++ % && ./a.out<CR>
endfunction
call CppSetup()

"--------------------------------------------------
" Markdown md
"--------------------------------------------------
let g:previm_open_cmd = 'google-chrome'

"--------------------------------------------------
" YCM youcompleteme
"--------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<C-J>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-K>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion=1

"--------------------------------------------------
" Snippets
"--------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set completeopt-=preview

"--------------------------------------------------
" Easymotion
"--------------------------------------------------
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
" search 2 chars
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)

"--------------------------------------------------
" Ctrlp
"--------------------------------------------------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

"--------------------------------------------------
" Autoformat
"--------------------------------------------------
augroup autoformat_settings
	"autocmd FileType bzl AutoFormatBuffer buildifier
	autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
	"autocmd FileType dart AutoFormatBuffer dartfmt
	"autocmd FileType go AutoFormatBuffer gofmt
	"autocmd FileType gn AutoFormatBuffer gn
	"autocmd FileType html,css,json AutoFormatBuffer js-beautify
	"autocmd FileType java AutoFormatBuffer google-java-format
	autocmd FileType python AutoFormatBuffer yapf
	 "Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

"--------------------------------------------------
" Ale linters
"--------------------------------------------------
let g:ale_completion_enabled = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_fix_on_save = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_echo_cursor = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_python_flake8_executable = 'python'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_pylint_executable = 'python'
let g:ale_python_pylint_options = '-m pylint'

"--------------------------------------------------
" Nerdtree Tags
"--------------------------------------------------
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__', 'venv']
nmap <F6> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
