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
1. [コントロールパネル](https://secure.sakura.ad.jp/koukaryoku-container)のタスク作成画面から以下の情報を入力してください。いずれも `docker run` コマンドを実行する時の要領で指定してください。
    * イメージ: 実行したいイメージ
    * コマンド: Dockerイメージの `CMD` を上書きする場合に指定
    * エントリーポイント: Dockerイメージの `ENTRYPOINT` を上書きする場合に指定
    * 環境変数: Dockerイメージ実行時に別途環境変数が必要な場合に指定
1. 「作成」ボタンをクリックし、タスクが終了するのを待ってください。
1. タスクが終了したら、「アーティファクト」の項目から生成物をダウンロードしてください。
    * 生成物はイメージによって異なります。

> [!NOTE]
> コマンドやエントリーポイント、環境変数などの意味はイメージによって異なります。
> 詳しくは、各イメージのREADMEを参照してください。

> [!IMPORTANT]
> `SAKURA_` で始まる環境変数名は、今後「高火力 DOK」により定義済み環境変数として使われる場合があるので指定しないでください。
> 定義済み環境変数については[マニュアル](https://manual.sakura.ad.jp/cloud/koukaryoku-container/running-tasks.html#koukaryoku-container-environment-variables)を参照してください。
