Tinytub's Vim config
==================
###new-version
1.mactype进行字体美化
2.安装各种字体
3.安装github,ctag
4.在_vimrc中设置
* `source $VIM/vimfiles/vimrc`
5.修改vimfiles/bundle.vim中的配置项(windows中)
* `set rtp+=$VIM/vimfiles/bundle/vundle/` 
* `call vundle#rc('$VIM/vimfiles/bundle/')`
  * 如果在VIM中参照以下设置
    * `set rtp+=~/.vim/bundle/vundle/` 
    * `call vundle#rc()`
6.按需求添加或删除bundle.vim中的插件,通过`#`号注释掉即可
7.打开vim,忽略错误提示.执行`:BundleInstall` 安装插件
8.插件列表
* 主要插件
{{{Bash
Bundle 'gmarik/vundle'
Bundle 'vimwiki'
Bundle 'Shougo/neocomplcache'     #自动补全
Bundle 'garbas/vim-snipmate'      #形如TextMate-style的补全方式
Bundle 'ervandew/supertab'        #搜索该文件内的字段进行补齐
Bundle 'honza/snipmate-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'   #传说中的某函数库
Bundle 'tomtom/tlib_vim'                #貌似也是个需求的函数库
Bundle 'Lokaltog/vim-easymotion'         #快速移动到某文字,回头设置并测试
        * <leader>e  为快捷键
Bundle 'scrooloose/nerdcommenter'       #注释当前行的工具,设置并测试 
Bundle 'kana/vim-smartinput'            #括号自动补全插件
Bundle 'godlygeek/tabular'              #根据各种标点符号来对齐文本
Bundle 'scrooloose/nerdtree'            #目录树
Bundle 'kien/ctrlp.vim'    #据说这货能快速打开文件,回头设置并测试一下
Bundle 'tpope/vim-fugitive'   #方便的在gvim中操作git?
Bundle 'Lokaltog/vim-powerline'    #底栏
Bundle 'scrooloose/syntastic'       #代码检查工具,win下不可用,暂时去死吧...
Bundle 'nvie/vim-togglemouse'
Bundle 'tpope/vim-markdown'
Bundle 'kien/rainbow_parentheses.vim'    #多重色彩括号,这个可以有.
* 色彩主题
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'

