" --------*--------*--------*--------*--------*--------*--------*--------
"  TIPS
" g; 前に変更した位置へカーソルを移動する
" :grep -R foo directory  
"   directory以下でfooを検索して、別ウィンドウを下に開いてくれて、ジャンプできる。
" yw 単語をYankバッファに入れる。
" b 単語の先頭に移動

" --------*--------*--------*--------*--------*--------*--------*--------
"" netrwは常にtree view
""let g:netrw_liststyle = 3
"" " CVSと.で始まるファイルは表示しない
""let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
"" " 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
""let g:netrw_altv = 1
"" " 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
"let g:netrw_alto = 1


" --------*--------*--------*--------*--------*--------*--------*--------
" タブ機能
nnoremap [Tag]  <Nop>
nmap t [Tag]
" t1 1番目のタブ, t2 2番目のタブ ......
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n ':<C-u>tabnext'.n.'<CR>'
endfor
" tc タブを開く
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" 次のタブへ
map <silent> [Tag]n :tabnext<CR>
" 前のタブへ
map <silent> [Tag]p :tabprevious<CR>

" --------*--------*--------*--------*--------*--------*--------*--------
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

" --------*--------*--------*--------*--------*--------*--------*--------
" シンタックスチェック
" javascriptを利用する場合、jshint/jslintのインストールが必須。jslintが良いよさげ
Bundle 'scrooloose/syntastic'

" Better Javascript Indentation
Bundle 'pangloss/vim-javascript'

" jQuery
Bundle 'jQuery'

"SQLUtilities : SQL整形、生成ユーティリティ
Bundle 'SQLUtilities'

" --------*--------*--------*--------*--------*--------*--------*--------
" Ruby, Rails etc
Bundle 'vim-ruby/vim-ruby'

"" :Emodel, :Eview, :Econtroller
"Bundle 'tpope/vim-rails'

Bundle 'slim-template/vim-slim'

" rspecのシンタックスハイライト
Bundle 'Keithbsmiley/rspec.vim'
autocmd BufReadPost,BufNewFile *_spec.rb set syntax=rspec

" --------*--------*--------*--------*--------*--------*--------*--------
Bundle 'digitaltoad/vim-jade'

" 最近開いたファイルの履歴管理ができます
" :MRU ファイルリストを表示
"   Enter カーソル上のファイルを開く
Bundle 'mru.vim'

Bundle 'elzr/vim-json'

Bundle 'plasticboy/vim-markdown'


" --------*--------*--------*--------*--------*--------*--------*--------
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
colorscheme elflord

" --------*--------*--------*--------*--------*--------*--------*--------
" ctags関連
" :tselect タグ名 で複数のタグから選択
" CTRL-]でジャンプ
nnoremap <C-]> g<C-]>

" --------*--------*--------*--------*--------*--------*--------*--------
"  ブックマーク https://github.com/MattesGroeger/vim-bookmarks
"  キーバインディングは変更した。
"  bm ブックマークする/しないのトグル
"  ba すべてのブックマークを表示する
"  bx すべてのブックマークをクリアする
Bundle 'MattesGroeger/vim-bookmarks'
nmap bm :BookmarkToggle<CR>
nmap ba :BookmarkShowAll<CR>
nmap bx :BookmarkClearAll<CR>

" mark aをvimのmarkに戻した。
nmap ma :mark a<CR>

let g:bookmark_auto_save = 1


" --------*--------*--------*--------*--------*--------*--------*--------
""  netrw
" netrwは常にtree view
"let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
"let g:netrw_altv = 1
" " 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
"let g:netrw_alto = 1


" --------*--------*--------*--------*--------*--------*--------*--------
filetype plugin indent on     " required!

" --------*--------*--------*--------*--------*--------*--------*--------
" vimgrepの使い方
" -------------
" :args `git ls-files app config -x *.png`           
" :args `find app -name '*.rb'`           
"   -> これで##にgitで管理しているファイル一覧のappとconfigが格納される
" :vim[grep] {pattern} ##
"   -> vimgrepで検索し、結果をウィンドウ(cw)で表示
" :cn[ext]  -> 次の検索結果へ
" :cN[ext]  -> 前の検索結果へ
"   http://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
" :cw[indow]  -> vimgrep検索結果をしたのウィンドウで表示する
"     (下記のQuickFixCmdPost)があるので不要。

" :vimgrep実行後、quickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow


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

