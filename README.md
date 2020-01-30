# 使用技術

- ruby 2.6.5
- rails 5.2.3
- PostgreSQL 11.3
- jQuery
- Bootstrap
- GitHub
- AWS

  - EC2/ELB
  - S3
  - SES
  - Route53
  - Certificate Manager

# Brain Share （説明共有アプリ）

# URL

<https://sharebrain.net/>

# 概要

何かを理解する際に、人に説明することが有効である。 しかし、説明される側はもちろん説明する側にとっても手間である。加えて、できる場所も限られる。 そこで、本アプリがその問題を解決します。 説明する側は、学んだことの説明を投稿するとコメント等のフィードバックを受け取り、それを元に改善していくことで理解を深めることが出来ます。また、何か調べ物をする人が説明を検索することで、説明をされる側となり各人の説明を比較・評価することで知識を得ることが出来ます。これは、場所を選ばず説明する側と説明を必要とする人をつなげる アプリです。

# 理想的なアプリの使用方法

説明投稿者<br>
説明を投稿 → いいね・コメント等のフィードバック → フィードバックを元に説明を更新 → 理解が深まる<br>

説明閲覧者<br>
分からないことを検索 → 複数人の説明を比較 → 自分あった解釈を獲得 → フィードバック

# コンセプト

知識だけでなく考え方も共有する<br>
説明する側、説明を受ける側双方に利がある

# 機能一覧

- ログイン機能
- サインアップ機能
- パスワード再設定機能
- マイページ
- ユーザー編集機能
- 説明一覧機能
- 説明投稿機能
- 説明詳細機能（過去の説明、説明の更新を表示）
- 説明編集機能
- 説明削除機能
- 説明更新機能
- ページネーション機能
- いいね機能
- コメント機能
- コメント返信機能
- 検索機能
- 不適切報告機能
- タグ作成機能<br>

管理者機能

- 不適切投稿一覧機能
- 不適切投稿削除機能
- カテゴリ作成機能

# カタログ設計

<https://docs.google.com/spreadsheets/d/e/2PACX-1vTOf4P8fk0nc0lMO1BoR7Ewknwy2N-rWBGWieWcqkzkfFmzvbVObv-10n5cLv4tS1pcFH1Z0po3x7pM/pubhtml>

# テーブル定義

<https://docs.google.com/spreadsheets/d/e/2PACX-1vT7OHMoktwUpF6dBTdhGSL4O6W5n_nvY6T5pb31pGo4FAQWpVNoziEnhjmVsaO3J_9eHJr-WAM4gvtH/pubhtml>

# E-R図

<https://docs.google.com/spreadsheets/d/e/2PACX-1vT2Y9-M2tFaobf-P9HoBjRsBBU0FPlDXUrxGVI0wKikwKXvFISEfrn6GOCGy03X5SUPDxscYHzyVZHW/pubhtml>

# 画面遷移図

<https://docs.google.com/spreadsheets/d/e/2PACX-1vR2ba39v-h_gJiUtfMtWUJ4iPaFaC-9zkChb2zQDbYPfShIiSR7sy0xkejU4apoLtlHG_WWQbDI5ivq/pubhtml>

# ワイヤーフレーム

<https://docs.google.com/spreadsheets/d/e/2PACX-1vQq4FNgRidXIrgYzmfgA_d7svGu_rNe5rMNksTsb_P7XsZqzK_KLPvS3vkeOT-DpXX3-mfIPm4u7wfT/pubhtml>

# 使用予定Gem

- device
- carrierwave
- mini_magick
- kaminari
- fog-aws
- ransack
