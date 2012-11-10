source $VIM/vimfiles/bundles.vim
"设置leader键位
let mapleader=","
let g:mapleader=","
"编码
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
"""""""""""""""""""""""""""""""""""""""""""""""
"一般设置
"""""""""""""""""""""""""""""""""""""""""""""""
"文件格式识别什么的 enable filetype dectection and ft specific plugin/indent
filetype off          " 非兼容模式 保证在Linux下可用
filetype on           " 侦测文件类型
filetype plugin indent on

" 开启高亮什么的 enable syntax hightlight and completion 
syntax enable
syntax on

"主题什么的 color theme
color monokai

"高亮当前行与列 highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" 搜索高亮
set incsearch
" 搜索时忽略大小写,有大写时按照大小写匹配
set ignorecase
set smartcase

" 编辑模式设置
" 当编辑一个文件时,直接跳到上次编辑的位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif
set nocompatible                                                  "不兼容vi
set nofoldenable                                                  " disable folding"
set confirm                                                       "未保存的文件在退出时进行询问 prompt when existing from an unsaved file
set history=1000
set autoread                                                      "当文件在外部发生更新时,自动读取
set backspace=indent,eol,start                                    "退格键设置 More powerful backspacing
set clipboard=unnamed                                             " 允许vim使用系统剪贴板


" display settings
set t_Co=256                                                      "256色 Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=2                                                   " 2 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2
set matchpairs+=<:>                                               " specially for html
"set relativenumber
"set ruler                                                         " show cursor position in status bar
"set showmode                                                      " show mode in status bar (insert/replace/...)
" 去掉声音告警
set noerrorbells
set novisualbell
set t_vb=
set tm=500                                                       "timeout

" 默认缩进设置
set autoindent
set smartindent     "智能识别
set tabstop=4       " tab 的宽度
set softtabstop=4   " tab 回退格数& 
set shiftwidth=4    " indent width
"set textwidth=79
set expandtab       "设置tab为空格字符
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79

"部分一般类型快捷键

" 在标签间移动
"上一个标签
map <S-H> gT
"下一个标签
map <S-L> gt
"新标签页 
map <C-t><C-t> :tabnew<CR>
"关闭标签页
map <C-t><C-w> :tabclose<CR>
" / 关闭搜索高亮
nmap <leader>/ :nohl<CR>
" :cd. 改变工作目录到当前文件目录
cmap cd. lcd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"插件设置
" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Rainbow parentheses for Lisp and variants
" rainbow的括号颜色设置
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
"最多16组颜色组合
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar   目前没开启
"let g:Tb_MaxSize = 2
"let g:Tb_TabWrap = 1
"hi Tb_Normal guifg=white ctermfg=white
"hi Tb_Changed guifg=green ctermfg=green
"hi Tb_VisibleNormal ctermbg=252 ctermfg=235
"hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<Leader>e'

" Tagbar  目前没开启
"let g:tagbar_left=1
"let g:tagbar_width=30
"let g:tagbar_autofocus = 1
"let g:tagbar_sort = 0 
"let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ",",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif

" Nerd Tree 
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "left"

" ZenCoding  未开启
"let g:user_zen_expandabbr_key='<C-j>'

" powerline
"let g:Powerline_symbols = 'fancy'

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" SuperTab
"let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2
    
" ctrlp
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.DS_Store  " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nnoremap <leader>a :Ack
nnoremap <leader>v V`]

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" eggcache vim
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" for macvim
if has("gui_running")
    set go=aAce  " remove toolbar
    "set transparency=30
    "set guifont=Monaco:h14
    set guifont=Menlo:h14
    set guifontwide=Microsoft\ Yahei\ Mono:h14
    set showtabline=2
    set columns=140
    set lines=40
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif


"Vimwiki转html设置
map <S-F4> :VimwikiAll2HTML<cr>
map <F4> :Vimwiki2HTML<cr>
 
" ######### VimWiki 写作助手 ######### "
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

" 声明可以在wiki里面使用的HTML标签
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h2,h4,h5,h6,pre,script,style'

"Vimwiki存储路径 vimwiki在dropbox目录下生成html文件会有问题
let g:vimwiki_list = [{'path': 'e:/Dropbox/vimwiki',
\ 'path_html': 'e:/vimwiki/html/',
\ 'auto_export': 1,
\ 'nested_syntaxes': {'python': 'python', 'Clang': 'c', 'C++': 'cpp', 'Lisp': 'lisp', 'Ruby': 'ruby', 'SQL': 'sql', 'Bash': 'sh', 'Vim': 'vim', 'Make': 'make', 'CMake': 'cmake', 'JS': 'javascript', 'CSS': 'css', 'HTML': 'html', 'XML': 'xml'},
\ 'diary_link_count': 5}]

"Vimwiki标题颜色设置
:hi VimwikiHeader1 guifg=#49FF00
:hi VimwikiHeader2 guifg=#7CFF00
:hi VimwikiHeader3 guifg=#7CFF00
:hi VimwikiHeader4 guifg=#7CFF00
:hi VimwikiHeader5 guifg=#7CFF00
:hi VimwikiHeader6 guifg=#7CFF00
