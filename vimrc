let mapleader = " "

" vim plug 插件管理器
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" leader + b 切换nerdtree
nnoremap <leader>b :NERDTreeToggle<CR>

" 不同vim模式修改光标
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set number " 显示行号
set relativenumber " 显示相对行号（这个非常重要，慢慢体会）
set hlsearch " 搜索结果高亮
set incsearch " 增量搜索
set autoindent " 自动缩进
set smartindent " 智能缩进
set tabstop=4 " 设置 tab 制表符所占宽度为 4
set softtabstop=4 " 设置按 tab 时缩进的宽度为 4
set shiftwidth=4 " 设置自动缩进宽度为 4
set expandtab " 缩进时将 tab 制表符转换为空格
set clipboard=unnamed " 共享系统剪切
filetype on " 开启文件类型检测
syntax on " 开启语法高亮
