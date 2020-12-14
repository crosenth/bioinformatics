#!/usr/bin/env bash
threads=100
image=quay.io/biocontainers/blast:2.10.1--pl526he19e7b1_3
db=/mnt/disk2/molmicro/common/ncbi/nt/latest
docker run --volume $(pwd):$(pwd) --workdir $(pwd) --volume $db:$db $image \
  blastn -num_threads $threads -db $db/nt -outfmt "10 qaccver saccver pident staxid" -query $1 | \
  classify --columns "qaccver,saccver,pident,staxid" | \
  ./cl
