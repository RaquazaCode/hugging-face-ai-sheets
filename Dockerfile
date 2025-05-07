FROM huggingfacedg/dataground:v0.0.0

# Set data dir under persisted volume (if enabled)
ENV DATA_DIR /data/dataground

# Configure HF cache to the persisted volume
ENV HF_HOME /data/hf_cache

# Available environment variables
#
# Uncomment the next line if you want to change the default timeout when requesting inference client (Default: 90 seconds)
# ENV INFERENCE_TIMEOUT=90000
#
# Uncomment the next line if you want to change the number of concurrent requests when generating data
# ENV NUM_CONCURRENT_REQUESTS=5

# Grant write access to the node app
RUN mkdir /data && chown -R node:node /data