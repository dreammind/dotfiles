1.phpの辞書は下記のように作った。
  http://c-brains.jp/blog/wsg/13/02/27-102230.php
  php -r '$f=get_defined_functions();echo join("\n",$f["internal"]);'|sort > .vim/dict/php.dict

