## README

<br>

御朱印認定アプリ
<br>
## Along With Your Kamisama
<br>
https://www.along-with-your-kamisama.com/
<br>
御朱印をオンライン上で認定します

<br>
主な機能は以下の４つです
<br>
①御朱印の発行機能
<br>
神社の参拝情報を入力いただくことで擬似的な御朱印を発行します
<br>
また、発行された御朱印を御朱印帳というかたちで確認ができます
<br>

②神社の参拝分析機能
<br>
ユーザーの参拝情報を自動で分析し、参拝している神社の傾向を知れます。

③神社の検索機能
<br>
全国約１万件の神社情報がDB上にあり、神社の詳細な情報を確認できます。

④SNS機能
<br>
他のユーザーの参拝記録をみることができ、
ユーザー同士で繋がることができます。


## 開発言語

- Ruby2.6.5
- Rails5.2.5

## 就業Termの技術

- devise 
- フォロー機能 
- お気に入り機能

## カリキュラム外の技術

- geocoder
- chartkick
- ransack
- aws S3
- Docker

## 実行手順
```
$ git clone https://github.com/TatsuyaIsamu/graduation_work.git  
$ cd graduation_work  
$ bundle install  
$ rails db:create && rails db:migrate  
$ rails db:seed_fu FIXTURE_PATH=db/fixtures/production 
$ rails s  
```

## インフラ構成図

![AWS Integration us-east-2(1) (1)](https://user-images.githubusercontent.com/83439358/139175695-ba009071-7bf2-4233-9230-ca782215a0ac.png)

## カタログ設計

https://docs.google.com/spreadsheets/d/1NJ2Dy1KI2wu31FM1h7kYqJw95OD9Y467HX9-wZsO_gQ/edit?usp=sharing

## テーブル定義書

https://docs.google.com/spreadsheets/d/1ah8qrtO9VEpVHyeTVtaDN26hBRPXxHx5YbApVA2ahVY/edit?usp=sharing

## ワイヤーフレーム

https://cacoo.com/diagrams/oPSurOI6rX0gZX5P/574D6

## ER図
[![Image from Gyazo](https://i.gyazo.com/3b1619c2d128dcd2692b2135f1bcddde.png)](https://gyazo.com/3b1619c2d128dcd2692b2135f1bcddde)

## 画面遷移図

https://cacoo.com/diagrams/rIiSjpS2bIJdmVHa/E8E2D

[![Image from Gyazo](https://i.gyazo.com/1994fb296643a0a9271e0d3f74580f43.png)](https://gyazo.com/1994fb296643a0a9271e0d3f74580f43)