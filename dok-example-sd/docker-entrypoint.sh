#!/bin/bash
# usage:
#   ./docker-entrypoint.sh "prompt1, prompt2, ..."
# output:
#   生成された画像をアーティファクト用ディレクトリー（${SAKURA_ARTIFACT_DIR}）に出力
set -ue
shopt -s nullglob

export TZ=${TZ:-Asia/Tokyo}

SD_PROMPT=${1:-masterpiece, high quality, realistic, HD, calico cat}
SEED=$RANDOM

echo "Start Running, Seed=${SEED}, Prompt=${SD_PROMPT}"

python3 scripts/txt2img.py \
  --prompt="${SD_PROMPT}" \
  --negative_prompt="worst quality, low quality, zombie, sketch, comic, nsfw" \
  --seed=$SEED \
  --H 512 \
  --W 512

# 生成された画像をアーティファクト用ディレクトリーに格納
cp -r ./outputs/txt2img-samples/* ${SAKURA_ARTIFACT_DIR}
ls -l ${SAKURA_ARTIFACT_DIR}

echo "Completed"
