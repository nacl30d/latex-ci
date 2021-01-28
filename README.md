latex-ci
===

LaTeXで書かれた論文をPDFにコンパイルしてReleaseするCI環境  

Features
---

- 学内用と学会用など複数バージョンを1つのリポジトリで管理することができます
- 1つのリリースで論文と論文要旨など複数の文書をコンパイルできます
- TexLive2020を使っているので，標準で原ノ味フォントが利用できます
- textlintによってトンマナの校正ができます
- huskyによってpre-commitをhookしてtextlintを走らせることができます

設定
---

- Circle CIとリポジトリを連携する
- Circle CIの環境変数`GITHUB_TOKEN`にGithubの[Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)（repoのフルアクセス）を設定する

使い方
---

### textlintを有効にする

`$ npm install`

[husky](https://typicode.github.io/husky/)によってpre-commit時にtextlintが走るようになります

### PDF化したいコミットにタグを付ける

`$ git tag -a thesis-v1.0.0 -m'thesis-v1.0.0'`

タグは'〈ターゲット名〉-vX.X.X'というフォーマット  

### タグをpushする

`$ git push --tags`


仕組み
---

- tex -> pdf は`latexmk`を使ってます
- latexmkを`Makefile`で実行しています
- タグの〈ターゲット名〉がMakefileのターゲット名になります
  - `thesis-v1.0.0`というタグをつけた場合，`make thesis`が実行されます
  - 概要と論文など2つのtexファイルを1つのコマンドでコンパイルすることができます

その他
---

- textlintはpre-commitで実行される前提なので，ciサーバ上では実行されません
- 付属の`.latexmkrc`はplatex仕様になっています．uplatexを利用する場合は差し替えてください

References
---

- [Automate GitHub Releases with CircleCI | circleci Blog](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

License
---

[MIT](https://choosealicense.com/licenses/mit/)
