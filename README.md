# git_tool
個人用gitツール

## レビュー用ブランチ作成ツール
### 概要
- 対象ファイル
   - review/git_review.sh
- pushされたリモートブランチを`review`という名称のローカルブランチにチェックアウトする。

### 使い方
1. `.gitignore`に以下のファイルを追加する。(`system`、もしくは`global`に登録することを推奨)
   - `.git_review`
1. `.zprofile`等に以下のエイリアスを設定する
   - `alias review='zsh <本プロジェクトを配置したディレクトリ>/git_tool/review/git_review.sh'`
1. git管理ディレクトリ配下にて、以下のコマンドを実行する
   - `review <レビュー対象ブランチ名>`
      - 例)`review feature/add_review`

## 簡易ログ表示用エイリアス
### 概要
- 以下の項目を1行で表示するエイリアス
   - コミットのハッシュ値
   - コミットの日付
   - コメント
   - ブランチ名/タグ名

### 使い方
1. `.zprofile`等に以下のエイリアスを設定する
   - `alias git_log='git log --date=iso --pretty='format:%C(yellow)%H %C(green)%ad %C(reset)%s %C(red)%d'`