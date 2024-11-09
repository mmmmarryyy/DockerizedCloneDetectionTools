#!/bin/bash

# Parameters:
#  -d: Path to dataset (by default: bcb_reduced)
#  -b: Turn ON -bce flag (by default: off)

DATASET_PATH="./bcb_reduced/"
LANGUAGE="java"

while getopts ":d:l" opt; do
  case $opt in
    d) DATASET_PATH="$OPTARG" ;;
    l) USE_BCE="$OPTARG" ;;
    \?) echo "Неверный параметр: -$OPTARG" >&2; exit 1 ;;
    :) echo "Параметр -$OPTARG требует аргумент." >&2; exit 1 ;;
  esac
done

cd ../CCStokener/runner

# Run CCStokener-runner container
docker run -it \
  --platform linux/amd64 \
  -e DATASET_PATH="${DATASET_PATH}" \
  -e LANGUAGE="${LANGUAGE}" \
  --name ccstokener-runner-container \
  ccstokener-runner

# Wait for end of container's work
docker wait ccstokener-runner-container

# Copy result
docker cp ccstokener-runner-container:/app/CCStokener/ccstokener/results ./result_$(date +%Y-%m-%d_%H-%M-%S)/

# Delete container
docker rm ccstokener-runner-container
