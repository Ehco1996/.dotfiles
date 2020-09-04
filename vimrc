" 用space做leader
let mapleader = " "

" buffer
noremap <leader>dw :bp\|bd #<cr>      " close current buffer
noremap <leader>bo :%bd\|e#\|bd#<cr>  " close other buffers, except current
nnoremap H :bp<cr> " H 向前切换buffer
nnoremap L :bn<cr> " L 向后切换buffer
nnoremap <leader>w :wa<cr>
vnoremap <leader>w <esc>:wa<cr>
nnoremap <leader>q :q<cr>

" leader + b 切换nerdtree
nnoremap <leader>b :NERDTreeToggle<CR>

" vim plug 插件管理器
call plug#begin('~/.vim/plugged')
" move
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" theme:
Plug 'doums/darcula'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" programming
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs' " 自动补全括号的插件，包括小括号，中括号，以及花括号
" terminal
Plug 'skywind3000/vim-terminal-help'
call plug#end()

" NERDtree
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '.git$', '.idea', '.vscode', '\.swp']
let NERDTreeChDirMode=3
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeRemoveFileCmd='rm '
let NERDTreeAutoDeleteBuffer=1
let g:nerdtree_tabs_focus_on_files=1
" let NERDTreeMouseMode=2 " 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" 不同vim模式修改光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set number " 显示行号
set cursorline "突出显示当前行
set hlsearch " 搜索结果高亮
set autoindent " 自动缩进
set smartindent " 智能缩进
set tabstop=4 " 设置 tab 制表符所占宽度为 4
set softtabstop=4 " 设置按 tab 时缩进的宽度为 4
set shiftwidth=4 " 设置自动缩进宽度为 4
set expandtab " 缩进时将 tab 制表符转换为空格
set clipboard=unnamed " 共享系统剪切
filetype on " 开启文件类型检测
filetype plugin indent on    " 启用自动补全
syntax on " 开启语法高亮
set noswapfile  " 不需要.swp文件
set mouse=a " 打开鼠
set updatetime=300

" fold
set foldenable
set foldmethod=indent
set foldlevel=99

" terminal
let g:terminal_height=20
let g:terminal_cwd=2
let g:terminal_kill='term'
let g:terminal_close=1
let g:terminal_list=0

" Airline
set noshowmode
set laststatus=1

let g:airline_powerline_fonts = 1 " https://github.com/powerline/fonts
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_highlighting_cache=1
let g:airline_extensions=["tabline","coc" ,"branch"]

" go
let g:go_list_type = "quickfix"
let g:go_def_mode = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

augroup vim-go

  au!
  au FileType go noremap <buffer> <F7> :GoFmt<cr>
  au FileType go noremap gd :GoDef<cr>

  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>gt  <Plug>(go-test)
  au FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" coc.nvim
" ===================
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" " Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
