#!/usr/bin/env bash

echo "*************Start download************"
# rclone --config rclone.conf ls ega:tf-prioritizer
# rclone --config rclone.conf sync \
#  --progress \
#  --log-file rclone-ukbec-sync.log \
#  --log-level DEBUG \
#  --checkers 8 \
#  --transfers 4 \
#  --drive-chunk-size 64M \
#  --max-backlog 999999 \
#  ega:ukbec-unaligned-fastq \
#  data/ukbec-unaligned-fastq

rclone --config rclone.conf copy \
  --progress \
  --log-file rclone-ukbec.log \
  --log-level DEBUG \
  --checkers 8 \
  --transfers 4 \
  --no-traverse \
  ega:ukbec-unaligned-fastq \
  data/ukbec-unaligned-fastq
status=$?
if [ $status = 0 ]; then
  echo "*************Download completed****************"
else
  echo "!!!!!!!!!!!!!Download failed!!!!!!!!!!!!!!!!!!!"
fi