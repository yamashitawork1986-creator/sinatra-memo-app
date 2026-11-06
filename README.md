# Sinatra Memo App

Sinatraで作成したシンプルなメモアプリです。

メモの新規登録・一覧表示・詳細表示・編集・削除ができます。

## 動作環境

- Ruby 4.0.6
- Bundler

## セットアップ

### 1. リポジトリをクローン

```bash
git clone https://github.com/yamashitawork1986-creator/sinatra-memo-app.git
```

### 2. ディレクトリに移動

```bash
cd sinatra-memo-app
```

### 3. 開発ブランチに切り替え

```bash
git switch sinatra-memo
```

### 4. 必要なGemをインストール

```bash
bundle install
```

Sinatra、RuboCop、ERB Lintなどの必要なGemがインストールされます。

### 5. アプリを起動

```bash
bundle exec ruby app.rb
```

ブラウザで以下のURLにアクセスしてください。

http://localhost:4567/memos

## コードチェック

### RuboCop

```bash
bundle exec rubocop
```

### ERB Lint

```bash
bundle exec erb_lint views/*.erb
```