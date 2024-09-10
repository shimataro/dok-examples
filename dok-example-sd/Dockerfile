ARG ROOT="./image"
ARG SD_DIR="/opt/stable-diffusion"

########################################
# ビルドステージ
FROM ubuntu:22.04 AS build

ARG ROOT SD_DIR

# 画像生成に使うチェックポイント
# https://huggingface.co/CompVis/stable-diffusion-v-1-4-original
ARG CHECKPOINT="https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt"

RUN mkdir -p ${ROOT}${SD_DIR}

# 必要なパッケージをインストール
RUN \
	apt update && \
	apt install -y --no-install-recommends ca-certificates sed patch git

# Stable Diffusionをclone
RUN \
	git clone --depth=1 https://github.com/CompVis/stable-diffusion.git ${ROOT}${SD_DIR} && \
	sed -E -e '/^ {4}- /!d'  -e 's/^ {4}- +//' ${ROOT}${SD_DIR}/environment.yaml >${ROOT}${SD_DIR}/requirements.txt

# チェックポイントをダウンロード
ADD ${CHECKPOINT} ${ROOT}${SD_DIR}/models/ldm/stable-diffusion-v1/model.ckpt

# パッチ適用
COPY stable-diffusion-pr558-negative-prompt.patch .
RUN patch -d ${ROOT}${SD_DIR} -p1 <./stable-diffusion-pr558-negative-prompt.patch

# docker-entrypoint.shのパーミッションを設定
COPY docker-entrypoint.sh ${ROOT}
RUN chmod a+x ${ROOT}/docker-entrypoint.sh

########################################
# 実行ステージ
FROM nvcr.io/nvidia/pytorch:22.08-py3

ARG ROOT SD_DIR

WORKDIR ${SD_DIR}

COPY --from=build ${ROOT} /

RUN \
	apt update && \
	apt install -y --no-install-recommends libsm6 libxrender1 libxext-dev && \
	apt clean && \
	pip install -r requirements.txt

ENTRYPOINT ["/docker-entrypoint.sh"]
