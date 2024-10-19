FROM argilladev/argilla-hf-spaces:pr-5572
# FROM argilla/argilla-hf-spaces:latest

COPY . /home/argilla/


ENV UVICORN_LOG_CONFIG=/home/argilla/log_config.yaml

ENV ARGILLA_DATABASE_SQLITE_TIMEOUT=5

# Uncoment this line to remove the persistence storage warning
#ENV ARGILLA_SHOW_HUGGINGFACE_SPACE_PERSISTENT_STORAGE_WARNING=false
