FROM argilla/argilla-quickstart:v1.5.0

# Define datasets to preload: full=all datasets, single=one dataset, and none=no datasets.
ENV LOAD_DATASETS=single

CMD whoami && /start_quickstart_argilla.sh