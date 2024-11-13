FROM --platform=linux/amd64 ubuntu:20.04

WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

# Installing dependencies
RUN apt-get update && apt-get install -y flex
RUN apt-get install -y git python3-pip
RUN apt-get install -y libboost-all-dev
RUN python3 -m pip install gdown==5.2.0

RUN git clone https://github.com/PCWcn/CCAligner.git

WORKDIR /app/CCAligner

# Setting up access rights
RUN chmod +x ./extract
RUN chmod +x ./parser
RUN chmod +x ./tokenize
RUN chmod +x ./detect
RUN chmod +x ./co1

COPY my_runner .

# Download and unpack IJaDataset
RUN gdown 1upcQ8Jqk8Mz_OdC47dI2WEng5CR8m6RM && \
    tar -xvf IJaDataset_BCEvalVersion.tar.gz

CMD bash ./my_runner
