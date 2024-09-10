# dok-examples

[高火力 DOK](https://www.sakura.ad.jp/koukaryoku-dok)のイメージ例です。

## イメージ一覧

|イメージ|説明|
|---|---|
|[dok-example-sd](./dok-example-sd)|[Stable Diffusion](https://github.com/CompVis/stable-diffusion)を使った画像生成|

## イメージの作成方法

作りたいイメージがあるディレクトリーに入り、以下を実行してください。

```bash
# "XXX" は適宜変更のこと
docker build --platform linux/amd64 -t dok-example-XXX .
```

または、このリポジトリーを直接参照してビルドもできます。

```bash
# "XXX" は適宜変更のこと
docker build --platform linux/amd64 -t dok-example-XXX https://github.com/shimataro/dok-examples.git#master:dok-example-XXX
```

ビルド時引数 `--build-arg` については、各イメージのREADMEを参照してください。

## イメージの実行方法

1. [高火力 DOK](https://www.sakura.ad.jp/koukaryoku-dok)にサインアップしてください。
1. 作成したイメージを、お好きなコンテナーレジストリーサービスへ登録してください。
1. [コントロールパネル](https://secure.sakura.ad.jp/koukaryoku-container)のタスク作成画面から以下の情報を入力してください。
    * イメージ: イメージを登録したコンテナーレジストリー
    * コマンド: Dockerイメージの `CMD` を上書きする場合に指定
    * エントリーポイント: Dockerイメージの `ENTRYPOINT` を上書きする場合に指定
    * 環境変数: Dockerイメージ実行時に別途環境変数が必要な場合に指定

> [!NOTE]
> コマンドやエントリーポイント、環境変数などの意味はイメージによって異なります。
> 詳しくは、各イメージのREADMEを参照してください。

> [!IMPORTANT]
> 環境変数には任意の値を指定できますが、 `SAKURA_` で始まる名前は今後「高火力 DOK」により定義済み環境変数として使われる場合があるので指定しないでください。
> 定義済み環境変数については[マニュアル](https://manual.sakura.ad.jp/cloud/koukaryoku-container/running-tasks.html#koukaryoku-container-environment-variables)を参照してください。
