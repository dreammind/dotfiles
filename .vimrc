set nocompatible               " be iMproved
filetype off                   " required!
set modeline

" 色付けon
syntax on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" 究極のvim的補完環境
" <C-x><C-k>するとsnippetsで補完される
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'

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

Bundle 'teramako/jscomplete-vim'

" jQuery
Bundle 'jQuery'

"SQLUtilities : SQL整形、生成ユーティリティ
Bundle 'SQLUtilities'

Bundle 'vim-ruby/vim-ruby'

Bundle 'digitaltoad/vim-jade'

" 最近開いたファイルの履歴管理ができます
" :MRU ファイルリストを表示
"   Enter カーソル上のファイルを開く
Bundle 'mru.vim'

filetype plugin indent on     " required!

" --------*--------*--------*--------*--------*--------*--------*--------
" passive_filetypesに登録していると、:SyntasticCheckすると、シンタックスチェックする
" :SyntasticToggleModeでOffされる。
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['javascript', 'c', 'cpp', 'cc', 'erb', 'rb', 'jade', 'php'] }

"エラー時、Quickfixが起動する
let g:syntastic_auto_loc_list = 1	
let g:syntastic_javascript_checker = 'jshint'

"
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" ファイルタイプごとの設定
" ts:tabstop, sw:shift width
autocmd FileType javascript set ts=2 sw=2 st=0 expandtab
autocmd FileType html set ts=2 sw=2 st=0 expandtab
autocmd FileType ruby set ts=2 sw=2 st=0 expandtab
autocmd FileType sh set ts=2 sw=2 st=0 expandtab
autocmd FileType xml set ts=2 sw=2 st=0 expandtab
autocmd FileType php set ts=4 dictionary=~/.vim/dict/php.dict
autocmd FileType jade set ts=2 sw=2 st=0 expandtab
