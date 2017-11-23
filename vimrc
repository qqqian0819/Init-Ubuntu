" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
"==========================================
" 基本设置
"==========================================
" 取消备份
set nobackup
set noswapfile

" 文件编码
set encoding=utf-8

" 查找
set ic
set hls
set is





"==========================================
"  显示设置
"==========================================
" 显示行号
set number

" 取消换行
set nowrap

" 显示光标当前位置
set ruler

" 设置缩进
set cindent

set tabstop=2
set shiftwidth=2

" 突出显示当前行
set cursorline

" 左下角显示当前 vim 模式
set showmode

" 启动 vim 时关闭折叠代码
set nofoldenable

" 主题

syntax enable
syntax on
set background=dark
"colorscheme molokai

let g:solarized_termcolors=256
colorscheme solarized

" vim-plug
"==========================================

call plug#begin('~/.vim/plugged')                                                                     

" ------------------------------------------
"  主题插件
"  ----------------------------------------

Plug 'altercation/vim-colors-solarized'

Plug 'tomasr/molokai'
" 树形目录
" -----------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" " 按下 F3 调出/隐藏 NERDTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
" 用符号跟踪文件状态
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:nerdtree_tabs_open_on_console_startup=1



" -----------------------------------------------
" 代码，引号，路径自动补全
" -----------------------------------------------
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }



" -----------------------------------------------
" 语法高亮，检查
" -----------------------------------------------
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

let g:ale_linters = {
\	'javascript': ['eslint'],
\	'css': ['stylelint'],
\}
let g:ale_fixers = {
\	'javascript': ['eslint'],
\	'css': ['stylelint'],
\}
let g:ale_fix_on_save = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)




" -----------------------------------------------
" 文件，代码搜索
" -----------------------------------------------
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

let g:ag_highlight=1
let g:ag_working_path_mode="r"

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|DS_Store|dist|build|coverage)|(\.(git|hg|svn)$)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }



" -----------------------------------------------
" 加强版状态条
" -----------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='papercolor'



" -----------------------------------------------
" 代码注释
" -----------------------------------------------
Plug 'scrooloose/nerdcommenter'

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
			\ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
			\ 'less': { 'left': '/*', 'right': '*/' }
		\ }

let g:NERDAltDelims_javascript = 1
let g:NERDDefaultNesting = 0



" -----------------------------------------------
" git
" -----------------------------------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'



" -----------------------------------------------
" Vim Markdown
" -----------------------------------------------
Plug 'suan/vim-instant-markdown'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0



" -----------------------------------------------
" Emmet
" -----------------------------------------------
Plug 'mattn/emmet-vim'
" 快捷键
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_settings = {
 		\ 'javascript.jsx' : {
    		\ 'extends' : 'jsx',
    	\ },
 		\ }



" -----------------------------------------------
" html5
" -----------------------------------------------
Plug 'othree/html5.vim'




" -----------------------------------------------
" css3
" -----------------------------------------------
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END



" -----------------------------------------------
" JavaScript
" -----------------------------------------------
Plug 'pangloss/vim-javascript'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax
"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1




" -----------------------------------------------
" React
" -----------------------------------------------
Plug 'mxw/vim-jsx'

let g:jsx_ext_required = 0



" -----------------------------------------------
" Prettier
" -----------------------------------------------
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync


call plug#end()

"映射复制、粘贴、剪贴ctrl+c ctrl+v ctrl+x
"
map <C-V> "+pa<Esc>
"
"
"
map! <C-V> <Esc>"+pa
"
map <C-C> "+y
"
map <C-X> "+x
"
"" 映射全选 ctrl+a

map <C-A> ggVG

map! <C-A> <Esc>ggVG

"ctrl+s为保存
"
map <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>
"
"ctrl+z撤销

map <C-Z> :u<CR>

map! <C-Z> <C-O>:u<CR>

"双击时高亮
"
map <2-leftmouse> \m
inoremap <2-leftmouse> <Esc>\m

"支持鼠标
"
set mouse=a



" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade
" PlugStatus
" PlugDiff
" PlugSnapshot
