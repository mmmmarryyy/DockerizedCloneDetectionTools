#!/bin/bash

cd ../CCAligner

# Запуск контейнера CCAligner
docker run -it \
 --platform linux/amd64 \
 --name ccaligner-container \
 ccaligner-detector

# Ожидание завершения работы контейнера
docker wait ccaligner-container

# Копирование результата
docker cp ccaligner-container:/app/CCAligner/output/ ./result_$(date +%Y-%m-%d_%H-%M-%S)/

# Удаление контейнера
docker rm ccaligner-container
