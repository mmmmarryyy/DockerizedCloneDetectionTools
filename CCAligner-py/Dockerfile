FROM ubuntu:20.04

WORKDIR /app

RUN apt-get update && apt-get install -y git python3-pip

RUN python3 -m pip install tree-sitter==0.20.1
RUN python3 -m pip install setuptools
RUN python3 -m pip install mmh3
RUN python3 -m pip install gdown

RUN git clone https://github.com/lokiplot/CCAligner.git

WORKDIR /app/CCAligner

RUN git clone https://github.com/tree-sitter/tree-sitter-python.git
RUN git clone https://github.com/tree-sitter/tree-sitter-java.git

RUN gdown 1upcQ8Jqk8Mz_OdC47dI2WEng5CR8m6RM && \
    tar -xvf IJaDataset_BCEvalVersion.tar.gz

COPY my_ccaligner.py src/ccaligner.py

RUN sed -i 's/\\W{old_name}\\W/\\b{old_name}\\b/g' src/lexical_analysis/obfuscation.py
RUN sed -i 's/os.mkdir(self._pretty_codebase_loc)/os.makedirs(self._pretty_codebase_loc, exist_ok=True)/g' src/lexical_analysis/pretty_printing.py

# CMD python3 ./src/ccaligner.py -from ./data/original_codebases/codebase1 -l python
CMD python3 ./src/ccaligner.py -from ./bcb_reduced/2 -l java
