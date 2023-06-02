#!/usr/bin/env bash

while IFS= read -r i;
do
  echo "****************Start download ${i}******************"
  rclone --config rclone.conf copy \
    --progress \
    --log-file rclone-ukbec.log \
    --log-level DEBUG \
    --checkers 8 \
    --transfers 4 \
    --no-traverse \
    ega:"${i}" \
    data/ukbec-unaligned-fastq
    echo "****************Download ${i} completed******************"
done < ukbec-unaligned.txt