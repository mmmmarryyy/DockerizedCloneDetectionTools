FROM --platform=linux/amd64 ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get install -y git python-is-python3

# Installing dependencies
RUN apt-get install -y python3-pip
RUN python -m pip install pandarallel==1.6.5
RUN python -m pip install gdown==5.2.0

RUN git clone https://github.com/CCStokener/CCStokener.git

WORKDIR /app/CCStokener/ccstokener

RUN chmod +x ./clone-detect/clonedetector
RUN chmod +x ./clone-detect/cloneverify

# Download and unpack IJaDataset
RUN gdown 1upcQ8Jqk8Mz_OdC47dI2WEng5CR8m6RM && \
    tar -xvf IJaDataset_BCEvalVersion.tar.gz

ENV DATASET_PATH="./bcb_reduced/"
ENV LANGUAGE="java"

CMD python runner.py -i $DATASET_PATH -m bcb -l $LANGUAGE
