#!/bin/bash

cd ../NiCad

# Run NiCad container
docker run -it \
  --platform linux/amd64 \
  --name nicad-container \
  nicad-detector

# Wait for end of container's work
docker wait nicad-container

date_time=$(date +%Y-%m-%d_%H-%M-%S)

# Copy result
docker cp nicad-container:/app/nicad-7.0.1-linux-x86_64/nicadclones ./results_$date_time/

cat ./results_$date_time/2/2_functions-blind-abstract-clones/2_functions-blind-abstract-clones-0.30.xml | sed 's$<source file="$$g' | sed 's$" startline="$,$g' | sed 's$" endline="$,$g' | sed 's$" pcid=.*"></source>$$g' | sed 's$<clone nlines=.*$$g' | sed 's$</clone>.*$$g' | sed 's$</clones>$$g' |sed 's$<clones>$$g' | sed 's$<cloneinfo.*$$g' | sed 's$<systeminfo.*$$g' | sed 's$<runinfo.*$$g' | sed '/^$/d' | paste -d ',' - - | sed "s#${path}/##g" | sed 's#/#,#g' > ./results/result_$date_time.txt

# TODO: here should add cleanup for ./results_$date_time directory later

# Delete container
docker rm nicad-container
