#!/bin/bash

# Parameters:
#  -d: Path to dataset (by default: bcb_reduced)
#  -b: Turn ON -bce flag (by default: off)

DATASET_PATH="bcb_reduced"
USE_BCE=""

while getopts ":d:b" opt; do
  case $opt in
    d) DATASET_PATH="$OPTARG" ;;
    b) USE_BCE="-bce" ;;
    \?) echo "Неверный параметр: -$OPTARG" >&2; exit 1 ;;
    :) echo "Параметр -$OPTARG требует аргумент." >&2; exit 1 ;;
  esac
done

cd ../NIL

# Run NIL container
docker run -it \
  -e NIL_DATASET_PATH="/app/NIL/${DATASET_PATH}" \
  -e USE_BCE="${USE_BCE}" \
  --name nil-container \
  nil-detector

# Wait for end of container's work
docker wait nil-container

# Copy result (list of clone pairs)
docker cp nil-container:/app/NIL/results/ ./

# Delete container
docker rm nil-container
