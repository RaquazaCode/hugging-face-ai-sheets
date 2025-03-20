FROM huggingfacedg/dataground-dev:main

# Set data dir under persisted volume (if enabled)
ENV DATA_DIR /data/dataground

ENV HF_HOME /data/hf_cache

# Grant write access to the node app
RUN mkdir /data && chown -R node:node /data
