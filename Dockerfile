FROM argilla/argilla-quickstart:latest

# Define datasets to preload: full=all datasets, single=one dataset, and none=no datasets.
ENV LOAD_DATASETS=single

CMD whoami && /start_quickstart_argilla.sh