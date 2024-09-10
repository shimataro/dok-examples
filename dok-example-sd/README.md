# dok-example-sd

[Stable Diffusion](https://github.com/CompVis/stable-diffusion)を使った画像生成（txt2img）

## ビルド

```bash
docker build --platform linux/amd64 -t dok-example-sd .
```

```bash
# このリポジトリーを直接参照する場合
docker build --platform linux/amd64 -t dok-example-sd https://github.com/shimataro/dok-examples.git#master:dok-example-sd
```

### `--build-arg`

|名前|説明|デフォルト値|備考|
|---|---|---|---|
|`CHECKPOINT`|画像生成に使うチェックポイント|<https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt>| PickleTensor形式(`.ckpt`)を指定すること|

チェックポイントは[Hugging Face](https://huggingface.co/)や[Civitai](https://civitai.com/)などからダウンロードできます。

```bash
# https://huggingface.co/hakurei/waifu-diffusion-v1-3 のチェックポイントを使う場合
docker build --platform linux/amd64 --build-arg CHECKPOINT=https://huggingface.co/hakurei/waifu-diffusion-v1-3/resolve/main/model-epoch09-full.ckpt -t dok-example-sd .
```

```bash
# https://civitai.com/models/45949/hakoniwalilycoverstyle のチェックポイントを使う場合（URLに&が含まれるので、引数をクォーテーションで囲うこと）
docker build --platform linux/amd64 --build-arg "CHECKPOINT=https://civitai.com/api/download/models/50570?type=Model&format=PickleTensor&size=pruned&fp=fp16" -t dok-example-sd .
```

## 実行

### 入力

#### `CMD`

画像生成に使うプロンプトを指定してください。
プロンプト全体を1つの引数として指定する必要があるため、プロンプトに空白文字が含まれる場合は全体をクォーテーションで囲ってください。

#### `ENTRYPOINT`

指定する必要はありません。
デフォルト値のまま実行してください。

#### 環境変数

指定する必要はありません。

### 出力

環境変数 `SAKURA_ARTIFACT_DIR` で指定されるディレクトリーに、生成された画像が出力されます。
