" ファイルの文字コードを自動認識
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp,ucs-bom,default,latin

set nocompatible               " be iMproved
filetype off                   " required!
set modeline

" 色付けon -> 下に移動。

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" 究極のvim的補完環境
" <C-x><C-k>するとsnippetsで補完される
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet-snippets.git'

let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" snippetsはまだ未登録
let g:neocomplcache_snippets_dir = "~/.vim/snippets"

" キーマップ
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)

" シンタックスチェック
" javascriptを利用する場合、jshint/jslintのインストールが必須。jslintが良いよさげ
Bundle 'scrooloose/syntastic'

" Better Javascript Indentation
Bundle 'pangloss/vim-javascript'

" なくなった。
" Bundle 'teramako/jscomplete-vim'

" jQuery
Bundle 'jQuery'

"SQLUtilities : SQL整形、生成ユーティリティ
Bundle 'SQLUtilities'

Bundle 'vim-ruby/vim-ruby'

" rspecのシンタックスハイライト
Bundle 'Keithbsmiley/rspec.vim'
autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec

Bundle 'digitaltoad/vim-jade'

" 最近開いたファイルの履歴管理ができます
" :MRU ファイルリストを表示
"   Enter カーソル上のファイルを開く
Bundle 'mru.vim'

Bundle 'elzr/vim-json'

Bundle 'plasticboy/vim-markdown'

Bundle 'slim-template/vim-slim'

" --------*--------
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
"colorscheme morning
" 奇数のインデント。いまは表示させない。
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=lightgrey
" 偶数インデントのカラー
" darkgrayもいいかも。2014/02/04
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgreen
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1
colorscheme default

" --------*--------
filetype plugin indent on     " required!


" --------*--------*--------*--------*--------*--------*--------*--------
" passive_filetypesに登録していると、:SyntasticCheckすると、シンタックスチェックする
" :SyntasticToggleModeでOffされる。
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['javascript', 'c', 'cpp', 'cc', 'erb', 'rb', 'jade', 'php', 'json', 'md', 'yaml', 'slim'] }

"エラー時、Quickfixが起動する
let g:syntastic_auto_loc_list = 1	
let g:syntastic_javascript_checker = 'jshint'

"
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType jade set omnifunc=jadecomplete#CompleteJade

" ファイルタイプごとの設定
" ts:tabstop, sw:shift width
autocmd FileType c set ts=2 sw=2 st=0 expandtab
autocmd FileType cpp set ts=2 sw=2 st=0 expandtab
autocmd FileType javascript set ts=2 sw=2 st=0 expandtab
autocmd FileType html set ts=2 sw=2 st=0 expandtab
autocmd FileType ruby set ts=2 sw=2 st=0 expandtab
autocmd FileType sh set ts=2 sw=2 st=0 expandtab
autocmd FileType xml set ts=2 sw=2 st=0 expandtab
autocmd FileType php set ts=4 dictionary=~/.vim/dict/php.dict
autocmd FileType jade set ts=2 sw=2 st=0 expandtab
autocmd FileType json set ts=2 sw=2 st=0 expandtab
autocmd FileType yaml set ts=2 sw=2 st=0 expandtab
autocmd FileType slim set ts=2 sw=2 st=0 expandtab

" .slimでうまくハイライトできない時、
" :setfiletype slimとすればハイライトされる。

" 色付けon. macのjadeの色付けがうまくいかないので、下に移動した。
syntax on
