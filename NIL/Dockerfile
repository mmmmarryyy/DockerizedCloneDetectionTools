FROM openjdk:21-jdk-slim

RUN apt-get update && apt-get install -y git python3-pip

RUN python3 -m pip install gdown==5.2.0 --break-system-packages

WORKDIR /app

RUN git clone https://github.com/kusumotolab/NIL

WORKDIR /app/NIL

# Download and unpack IJaDataset
RUN gdown 1upcQ8Jqk8Mz_OdC47dI2WEng5CR8m6RM && \
  tar -xvf IJaDataset_BCEvalVersion.tar.gz

# Build NIL
RUN ./gradlew ShadowJar

ENV NIL_DATASET_PATH="./bcb_reduced"
ENV USE_BCE=""

RUN mkdir results

CMD java -jar ./build/libs/NIL-all.jar -s $NIL_DATASET_PATH $USE_BCE --output results/output_$(date +%Y-%m-%d_%H-%M-%S).txt
