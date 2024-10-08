# FROM argilladev/argilla-hf-spaces:pr-5585
FROM argilla/argilla-hf-spaces:latest

# Copy the auth config section
#COPY .oauth.yaml /home/argilla/
#COPY log_config.yaml /home/argilla/
COPY . /home/argilla/

ENV UVICORN_LOG_CONFIG=/home/argilla/log_config.yaml

# Uncoment this line to remove the persistence storage warning
#ENV ARGILLA_SHOW_HUGGINGFACE_SPACE_PERSISTENT_STORAGE_WARNING=false
