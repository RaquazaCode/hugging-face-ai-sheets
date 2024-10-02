# Related PR https://github.com/argilla-io/argilla/pull/5467
FROM argilladev/argilla-hf-spaces:releases-2.3.0

# Copy the auth config section
COPY .oauth.yaml /home/argilla/

COPY log_config.yaml /home/argilla/

ENV UVICORN_LOG_CONFIG=/home/argilla/log_config.yaml

# Uncoment this line to remove the persistence storage warning
#ENV ARGILLA_SHOW_HUGGINGFACE_SPACE_PERSISTENT_STORAGE_WARNING=false
