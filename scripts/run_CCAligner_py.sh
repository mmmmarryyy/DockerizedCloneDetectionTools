#!/bin/bash

cd ../CCAligner-py

# Запуск контейнера CCAligner
docker run -it \
 --name ccaligner-py-container \
 ccaligner-py-detector

# Ожидание завершения работы контейнера
docker wait ccaligner-py-container

# Удаление контейнера
docker rm ccaligner-py-container
