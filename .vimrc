" --------*--------*--------*--------*--------*--------*--------*--------
" ミニヘルプ
"   <C-o>      前回のジャンプ位置に戻る
"   <C-i>      次回のジャンプ位置に進む
"   <C-]>      タグジャンプ
"   <C-t>      戻る
"   <C-p>      ファイルを選択するctrlpプラグイン
"   Pm         以前開いたファイル履歴から検索
"   Y          一行ヤンク
"   yw         一単語をヤンクバッファに入れる
"   <Leader>m  MRU
"   <Leader>s  シンタックスチェック
"   <Leader>w  ファイル書き込み
"   <Leader>q  quit
"   V          行単位のビジュアルモード
"   <C-v>      矩形単位のビジュアルモード
"              y でヤンクできる
"              I 矩形で文字挿入


" [python]
"   K          カーソル上のメソッドのpydocを表示。便利
"   <Leader>d  定義にジャンプ

" [golang]
"   .<C-x> <C-o> 補完
"   <C-]>       定義にジャンプ(:GoDef)
"   <Leader>d   定義を分割ウィンドウで表示
"   <Leader>b   ビルド
"   <Leader>r   実行

" http://postd.cc/how-to-boost-your-vim-productivity/
" ,w でファイル書き込み。
let mapleader = ","
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>m :MRU<CR>

" --------*--------*--------*--------*--------*--------*--------*--------
" http://itchyny.hatenablog.com/entry/2014/12/25/090000

" 補完メニューの高さ good!
set pumheight=10
" .swpファイルがある時、read-onlyで開く。 good!
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" カッコの対応で一瞬カーソルが飛ぶときの飛ぶ時間を0.1秒に設定。
set showmatch
set matchtime=1
" Yで一行ヤンク
nnoremap Y y$
" 一行が長すぎても表示される
set display=lastline

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
set encoding=utf-8
set fileformats=unix,dos,mac

" --------*--------*--------*--------*--------*--------*--------*--------
"  Vundle
"  :PluginInstall! プラグインをインストールする。
set nocompatible               " be iMproved
filetype off                   " required!
set modeline

" 色付けon -> 下に移動。

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 究極のvim的補完環境
" <C-x><C-k>するとsnippetsで補完される
Plugin 'Shougo/neocomplcache.git'
Plugin 'Shougo/neosnippet-snippets.git'

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
" 最近開いたファイルの履歴管理
" :MRU ファイルリストを表示
"   Enter カーソル上のファイルを開く
Plugin 'mru.vim'


" --------*--------*--------*--------*--------*--------*--------*--------
"  多機能なファイルセレクター
"  1) ファイルの検索開始 CTRL-P
Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_map = '<C-p>'
" 以前開いたファイルの履歴から検索
nmap Pm :<C-u>CtrlPMRUFiles<CR>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" --------*--------*--------*--------*--------*--------*--------*--------
"  言語関連
"
Plugin 'vim-ruby/vim-ruby'

" javascriptを利用する場合、jshint/jslintのインストールが必須。jslintがよさげ
" Better Javascript Indentation
Plugin 'pangloss/vim-javascript'

" jQuery
Plugin 'jQuery'

"SQLUtilities : SQL整形、生成ユーティリティ
Plugin 'SQLUtilities'
" :Emodel モデル名, :Eview ビュー名, :Econtroller コントローラ名
" gf は、
" :A でrspecとの行き来ができる
" :R でdb/schemaとの行き来ができる
Plugin 'tpope/vim-rails'

Plugin 'digitaltoad/vim-jade'

Plugin 'elzr/vim-json'
Plugin 'GutenYe/json5.vim'

" tabularで表の整形をするのが便利
" ex)
"   a, b,c
"   ddd, eee, fff
"   :Tabulaize /,/
"   -> 結果
"   a   , b   , c
"   ddd , eee , fff
" ex2)
"    |a|b|c|
"    |ddd|eee|fff|
"    :Tabularize /|/
"    | a   | b   | c   |
"    | ddd | eee | fff |
" The tabular plugin must come before vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

Plugin 'derekwyatt/vim-scala'

Plugin 'Matt-Deacalion/vim-systemd-syntax'

Plugin 'tfnico/vim-gradle'

" rspecのシンタックスハイライト
Plugin 'Keith/rspec.vim'

Plugin 'slim-template/vim-slim'

Plugin 'uarun/vim-protobuf'

" --------*--------*--------*--------*--------*--------*--------*--------
" python plugin
"   http://qiita.com/tekkoc/items/923d7a7cf124e63adab5
" キーマップ
"   K カーソル上のメソッドのpydocを表示。便利
Plugin 'davidhalter/jedi-vim.git'


" --------*--------*--------*--------*--------*--------*--------*--------
" golang
" vim-goは、:help vim-go にヘルプが記述
" [注意]
"   1)ファイル書き込み時に自動的にformatが掛かるようだ
"   2)githubからダウンロードしたパッケージでは補完ができない
"     http://qiita.com/koara-local/items/6c886eccfb459159c431
"
"   .<C-x> <C-o> 補完
"   <C-]>       定義にジャンプ(:GoDef)
"   <Leader>d   定義を分割ウィンドウで表示
"   <Leader>b   ビルド
"   <Leader>r   実行
" よく使うコマンドは
" :GoFmt  :GoRun
Plugin 'fatih/vim-go'

" nfs/gocodeは、最初に
"   1)go get -u github.com/nsf/gocode
"   2)go get -u github.com/davidrjenni/reftools/cmd/fillstruct
"   3)vimから :GoInstallBinaries を実行
"   4)~/.vim/bundle/gocode/vim/update.sh
"   5)~/.vim/bundle/gocode/vim/symlink.sh
Plugin 'nsf/gocode', { 'rtp': 'vim/' }

" disable fmt on save
let g:go_fmt_autosave = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" --------*--------*--------*--------*--------*--------*--------*--------
" vue.js
Plugin 'posva/vim-vue'

" --------*--------*--------*--------*--------*--------*--------*--------
"  aceはslimやjadeのgolang版
Plugin 'yosssi/vim-ace'

" --------*--------*--------*--------*--------*--------*--------*--------
"
"
Plugin 'leafgarland/typescript-vim'

" --------*--------*--------*--------*--------*--------*--------*--------
autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
autocmd FileType go nmap <Leader>s  <Plug>(go-implements)
autocmd FileType go nmap <Leader>d  <Plug>(go-def-split)
autocmd FileType go nmap <Leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>r  <Plug>(go-run)
autocmd FileType go set ts=2 sw=2 st=2

" --------*--------*--------*--------*--------*--------*--------*--------
Plugin 'nathanaelkane/vim-indent-guides'
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
" 1) CTRL-]でジャンプ
" 2) CTRL-tで直前のタグに戻る
nnoremap <C-]> g<C-]>
let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function;p:property'

" --------*--------*--------*--------*--------*--------*--------*--------
"  ブックマーク https://github.com/MattesGroeger/vim-bookmarks
"  キーバインディングは変更した。
"    Bm ブックマークする/しないのトグル
"    Ba すべてのブックマークを表示する
"    Bx すべてのブックマークをクリアする
Plugin 'MattesGroeger/vim-bookmarks'
let g:bookmark_no_default_key_mappings = 1

nmap Bm :BookmarkToggle<CR>
nmap Ba :BookmarkShowAll<CR>
nmap Bn :BookmarkNext<CR>
nmap Bp :BookmarkPrev<CR>
nmap Bx :BookmarkClearAll<CR>

" ブックマークをグローバルにしてみた 2017/08/15
let g:bookmark_save_per_working_dir = 0
let g:bookmark_auto_save = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_auto_save = 1
let g:bookmark_auto_close = 1

" --------*--------*--------*--------*--------*--------*--------*--------
""  netrw
" netrwは常にtree view
"let g:netrw_liststyle = 3
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
"let g:netrw_altv = 1
" " 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
"let g:netrw_alto = 1



" --------*--------*--------*--------*--------*--------*--------*--------
" vimgrepの使い方
" -------------
" こういう形式の使えるよ
"   :vim {pattern} app/**/*.rb
"   :args ./**/*.html
"
" :args `git ls-files app config -x *.png`
" :args `find app -name '*.rb'`
"   -> これで##にgitで管理しているファイル一覧のappとconfigが格納される
" :args `git ls-files '*.go'`
"   -> git管理下なら、go関連のファイルだけを対象にするなら
" :args `find . -type d -name 'vendor' -prune -o -name '*.go' -print`
"
" :vim[grep] {pattern} ##
"   -> vimgrepで検索し、結果をウィンドウ(cw)で表示
" :cn[ext]  -> 次の検索結果へ
" :cN[ext]  -> 前の検索結果へ
"   http://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
" :cw[indow]  -> vimgrep検索結果をしたのウィンドウで表示する
"     (下記のQuickFixCmdPost)があるので不要。
" :vimgrep実行後、quickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

" キーマップを追加. GはGrepの意味。
nmap Gn :cnext<CR>
nmap Gp :cprevious<CR>

" --------*--------*--------*--------*--------*--------*--------*--------
" カッコを入力すると、自動的に閉じカッコも挿入される。insertモードのままなので
" 便利。不要なESCを何度も入力しないといけないので、使わないようにした。
"Plugin 'Townk/vim-autoclose'

" --------*--------*--------*--------*--------*--------*--------*--------
"  editorconfigは複数のエディタ間で共通のインデントやエンコーディング
"  を共有化できる。
" カレントディレクトリの.editorconfigを読み込む
Plugin 'editorconfig/editorconfig-vim'

" --------*--------*--------*--------*--------*--------*--------*--------
"  多言語シンタックスチェック
Plugin 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': [ ],
    \ 'passive_filetypes': ['javascript', 'c', 'cpp', 'cc', 'erb', 'rb', 'jade', 'php', 'json', 'md', 'yaml', 'slim', 'python', 'sh'] }

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pylint']

" ファイルセーブ時に自動的にシンタックスチェックしない
let g:syntastic_check_on_wq = 0


" --------*--------*--------*--------*--------*--------*--------*--------
"  Vundle.vimの終端
call vundle#end()		" required!
filetype plugin indent on     	" required!

" --------*--------*--------*--------*--------*--------*--------*--------
"
autocmd FileType javascript set omnifunc=jscomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType jade set omnifunc=jadecomplete#CompleteJade

" ファイルタイプごとの設定
" ts:tabstop, sw:shift width, st=soft tab stop,
autocmd FileType c   set ts=2 sw=2 st=2 expandtab
autocmd FileType cpp set ts=2 sw=2 st=2 expandtab
autocmd FileType javascript set ts=2 sw=2 st=2 expandtab
autocmd FileType html set ts=2 sw=2 st=2 expandtab
autocmd FileType ruby set ts=2 sw=2 st=2 expandtab
autocmd FileType sh  set ts=2 sw=2 st=2 expandtab
autocmd FileType xml set ts=2 sw=2 st=2 expandtab
autocmd FileType php set ts=4 sw=4 st=2 expandtab dictionary=~/.vim/dict/php.dict
autocmd FileType go set ts=2 sw=2 st=2
autocmd FileType jade set ts=2 sw=2 st=2 expandtab
autocmd FileType slim set ts=2 sw=2 st=2 expandtab
autocmd FileType ace set ts=2 sw=2 st=2 expandtab

autocmd FileType json set ts=2 sw=2 st=2 expandtab
autocmd FileType yaml set ts=2 sw=2 st=2 expandtab
autocmd FileType gradle set ts=2 sw=2 st=2 expandtab
autocmd FileType python set ts=4 sw=4 st=4 expandtab
autocmd FileType vue set ts=2 sw=2 st=2 expandtab
" マークダウンのインデントはスペース4つが基本
autocmd FileType markdown set ts=4 sw=4 st=4 expandtab
autocmd FileType protobuf set ts=2 sw=2 st=2 expandtab

" 保存時に行末の空白を自動で削除
autocmd BufWritePre * :%s/\s\+$//ge

" .slimでうまくハイライトできない時、
" :setfiletype slimとすればハイライトされる。

" 色付けon. macのjadeの色付けがうまくいかないので、下に移動した。
syntax on

