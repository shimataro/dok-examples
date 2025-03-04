# dok-example-a1111

[Stable Diffusion web UI](https://github.com/AUTOMATIC1111/stable-diffusion-webui)の起動

## ビルド

```bash
docker build --platform linux/amd64 -t dok-example-a1111 .
```

```bash
# このリポジトリーを直接参照する場合
docker build --platform linux/amd64 -t dok-example-a1111 https://github.com/shimataro/dok-examples.git#master:dok-example-a1111
```

## 実行

### 入力

#### コマンド

指定する必要はありません。
`CMD` デフォルト値のまま実行してください。

#### HTTP

`7860` ポートを指定してください。

#### エントリーポイント

指定する必要はありません。
`ENTRYPOINT` デフォルト値のまま実行してください。

#### 環境変数

|環境変数名|意味|デフォルト値|備考|
|---|---|---|---|
|`PORT`|Listenするポート番号|7860|この値を指定する場合は、上記「HTTP」のポートも変更してください|

## Dockerでの実行例

```bash
docker run --gpus all -p 7860:7860 dok-example-a1111
```

サービスが起動するまで待ち、起動したら<http://localhost:7860>にアクセスしてください。

## ToDo

* [ ] ビルド時、または実行時にチェックポイントファイルを指定できるようにする
* [ ] 生成したイメージを `SAKURA_ARTIFACT_DIR` に保存
